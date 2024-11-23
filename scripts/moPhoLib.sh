DELETE_BACKUP_IN_DAYS=${DELETE_BACKUP_IN_DAYS:-30}

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
  if [[ $(findOffset "$1") -gt 4 ]]; then
    return 0
  else
    return 1
  fi
}

function isVideo() {
  if [[ $(findOffset "$1") == 4 ]]; then
    return 0
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
  dd "if=${inputFile}" "of=${outputFile}" bs=$((ofs - 4)) skip=1 2>/dev/null
}

function rmFile() {
  local originalFilePath="$1"

  folder=$(dirname "${originalFilePath}")
  baseFileName=$(basename "${originalFilePath}")
  deletionDate="$(($(date +%s) + "$DELETE_BACKUP_IN_DAYS" * 86400))"
  trashedPath="${folder}/.trashed-${deletionDate}-${baseFileName}"
  mv "${originalFilePath}" "${trashedPath}"
  echo "${trashedPath}"
}
