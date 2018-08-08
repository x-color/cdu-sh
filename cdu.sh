function _usage_cdu {
  echo "Usage:"
  echo "  cdu [-a] [-c] [-h] [-i] [-p] PATTERN"
  echo ""
  echo "Description:"
  echo "  Change directory that matching pattern"
  echo "  (default: matching under the home directory)"
  echo ""
  echo "Options:"
  echo "  -a    matching directoryes under the root directory"
  echo "  -c    matching directoryes under the current directory"
  echo "  -h    print this help"
  echo "  -i    ignore case distinctions when matching pattern"
  echo "  -p    perfect matching"
}

function cdu {
  local OPTIND OPTARG OPT
  local flg_perfect flg_ignore
  local first_path=$(cd ~; pwd)

  # Options parser
  while getopts achip OPT
  do
    case $OPT in
      "a" ) first_path="/" ;;
      "c" ) first_path=$(pwd) ;;
      "h" ) _usage_cdu
            return 1 ;;
      "i" ) flg_ignore="-i" ;;
      "p" ) flg_perfect="\\" ;;
        * ) _usage_cdu
            return 1 ;;
    esac
  done

  # Delete options
  shift `expr $OPTIND - 1`

  if [ $# = 0 ]
  then
    _usage_cdu
    return 1
  fi

  local unique_paths=$(locate $flg_ignore -q -e -b ${flg_perfect}$1)
  if [ "$unique_paths" = "" ]
  then
    echo "Can not find directory!!" 1>&2
    return 1
  fi

  local unique_dir=$(file $unique_paths | sed '/:\n[ ]+/d' | grep ^${first_path}.*directory$ | head -n 1 | rev | cut -d : -f2- | rev)
  echo "=> $unique_dir"
  cd $unique_dir
}
