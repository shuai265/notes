#!/bin/bash

download_dir(){
    local SPACE_IDENTIFER="GGGDDDGGG"
    local TMP_FILE_LIST=tmp_file_list.txt

    local dir_id=$1
    # 获取列表
    echo "$(gdrive list --query " '$dir_id' in parents" -m 1000)" > $TMP_FILE_LIST
    # 删除第一行
    sed -ig "1d" $TMP_FILE_LIST
    local file_list[0]=""
    local i=0
    while read data; do
	    local id="$(echo "$data" | awk '{printf $1}')"
	    echo "[ID] "$id
        local type="$(echo "$data" | grep -o "  [^ ][a-zA-Z]*  "| sed "s/ //g")"
        echo "[TYPE] "$type
        local name="$(echo "$data" | sed "s/$id//g" | grep -o "\-.* $type"| sed "s/-[ ]//g" | sed "s/[ ]$type//g")"
        echo "[FILE] "$name
        file_list[i]="$id $type $name"
        i=`expr $i + 1`
    done < $TMP_FILE_LIST

    local total_cnt=${#file_list[*]}
    local i=0
    echo $file_list
    echo $total_cnt
    while(( $i<$total_cnt  ))
    do
        local current_file=${file_list[$i]}
        local file_id="$(echo $current_file | awk '{printf $1}')"
        echo 'FILE_ID:'$file_id
        local file_type="$(echo $current_file | awk '{printf $2}')"
        echo 'FILE_TYPE:'$file_type
        local file_name="$(echo $current_file | awk '{printf $3}')"
        echo 'FILE_NAME:'$file_name

        i=`expr $i + 1`

        # do download
        if [[ $file_type == 'dir' ]]
        then
            mkdir $file_name
            cd $file_name
            download_dir $file_id
            cd ..
        elif [[ $file_type == 'doc' ]]
        then
            # download doc (excel or word)
            echo 'download doc'
            local mime="$(gdrive export $file_id --print-mimes)"
            local word_mime="application/vnd.openxmlformats-officedocument.wordprocessingml.document"
            local excel_mime="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
            if [[ $mime == *$word_mime* ]]; then
                gdrive export $file_id -f --mime $word_mime
            elif [[ $mime == *$excel_mime* ]]; then
                gdrive export $file_id -f --mime $excel_mime
            else
                gdrive download $file_id
            fi
        else
            # download unknown type file directly
            echo 'download unknown type file'
            gdrive download $file_id
        fi

    done
}

if [[ $1 == '-h' ]]
then
    echo '-d dir_id'
    echo 'no more'
elif [[ $1 -eq '-d' ]]
then
    echo 'start download dir_id:'$2
    download_dir $2
else
    echo 'no'
fi

