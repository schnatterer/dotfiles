# Returns the byte offset of the video or zero if none found
# Note that the offset of a plain mp4 is 4
function findOffset() {
  local ofs file="$1" 
  ofs=$(grep --byte-offset --only-matching --text "ftypmp4\|ftypisom" "${file}" || true)
  # e.g. 3681584:ftypisom -> 3681584
  ofs=${ofs%:*}
  echo "${ofs:-0}"
}

function isMotionPhoto() {
  if [[ $(findOffset "$1") -gt 0 ]]; then
    return 0;
  else
    return 1
  fi
}

function isVideo() {
  if [[ $(findOffset "$1") == 4 ]]; then
    return 0;
  else
    return 1
  fi
}

function extractVideo() {
  local inputFile="$1"
  local outputFile="$2"
    ofs=$(findOffset "${inputFile}")
    # Copy from ftyp (4 bytes before ofs) to outputfile, skip header
    # Alternative:
    # EXIF: Directory Item Length 
    # bs={filelen-Directory Item Length}
    # https://github.com/GrapheneOS/Camera/issues/75
    dd "if=${inputFile}" "of=${outputFile}" bs=$((ofs - 4)) skip=1
}
