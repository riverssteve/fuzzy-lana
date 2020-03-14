function fetch
    set -l applied_patch (hg qapplied 2> /dev/null)
    if test "$applied_patch" = ""
        printf "No patch applied, will not fetch"
        return
    end
    hg qpop -a
    hg fetch
    hg qpush --move $applied_patch
end
