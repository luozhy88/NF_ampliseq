echo "此脚本用于美吉16s数据fq格式转换，对于没有压缩为gz，进行gz格式压缩，样本命中_改为-  "
echo "运行次脚本请位于fq文件目录中运行  "


for A in `ls *fq`;do
  echo $A
  #A="raw.split.AD_2018_03.2.fq"
  B="1.fq"
  if [[ $A == *$B* ]]
  then
      echo "包含1"
      
      #file_test=raw.split.AD_2018_02.1.fq
      file_test=$A
      echo $file_test
      file1=${file_test##*raw.split.}
      echo $file1
      file2=${file1%*.1.fq}
      echo $file2
      file2=${file2//_/-}
      echo $file2

      mv $file_test ${file2}_R1_001.fastq
      gzip ${file2}_R1_001.fastq
      
  else
      echo "包含2"
      
      #file_test=raw.split.AD_2018_02.2.fq
      file_test=$A
      echo $file_test
      file1=${file_test##*raw.split.}
      echo $file1
      file2=${file1%*.2.fq}
      echo $file2
      file2=${file2//_/-}
      echo $file2
      
      mv $file_test ${file2}_R2_001.fastq
      gzip ${file2}_R2_001.fastq
  fi

done