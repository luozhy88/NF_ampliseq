# nextflow, config添加如下信息来跑stratified的数据
process {
  withName: PICRUST {
        ext.args = "-t epa-ng --remove_intermediate --stratified"
  }
}

# fq的信息表生成
python3 /home/yuafen/data/script/fastq_dir_to_samplesheet.py /data/yuafen/rawdata/16s/yaoming_test2/yaoming_test2_49 B04.csv
python3 /home/yuafen/data/script/fastq_dir_to_samplesheet.py /data/yuafen/rawdata/16s/yaoming_test4/yaoming_test4_49 B05.csv
cat *csv >all.tsv



# NF_ampliseq 2.5.0
https://github.com/nf-core/ampliseq  
https://nf-co.re/docs/usage/installation

export NXF_SINGULARITY_CACHEDIR="/data/zhiyu/software/nfcore/singularity" #定义SINGULARITY的img位置方法

./nextflow run /home/yuafen/data/software/nfcore-ampliseq-2.5.0/ampliseq-2.5.0/  -profile docker -params-file /home/yuafen/data/test/test3/nf-params.json --FW_primer ACTCCTACGGGAGGCAGCA   --RV_primer GGACTACHVGGGTWTCTAAT  --classifier "/data2/zhiyu/software/nfcore/v2.4.0/silva-138-ssu-nr99-338f-806r-20210804-binbinzhao-classifier.qza"

# NF_ampliseq 2.7.0
#./nextflow run nf-core/ampliseq -r 2.7.0 -profile docker  --outdir ceshi2 --input_folder  /data/zhiyu/software/nfcore/V2.7.0/rawdata --FW_primer CCTACGGGNGGCWGCA --RV_primer GACTACHVGGGTATCTAAT --email 479321347@qq.com --picrust  --kraken2_ref_taxonomy silva=138

/data/zhiyu/software/nfcore/V2.7.0/nextflow run nf-core/ampliseq -r 2.7.0 -profile docker    --input_folder  /data/zhiyu/software/nfcore/V2.7.0/rawdata   --FW_primer ACTCCTACGGGAGGCAGCA   --RV_primer GGACTACHVGGGTWTCTAAT  --email 479321347@qq.com --picrust   --kraken2_ref_tax_custom https://genome-idx.s3.amazonaws.com/kraken/k2_standard_20230605.tar.gz  --kraken2_assign_taxlevels "D,P,C,O,F,G,S"  --extension "/*_R{1,2}_001.fastq.gz" --outdir results

/data/zhiyu/software/nfcore/V2.7.0/nextflow run nf-core/ampliseq -r 2.7.0 -profile docker    --input_folder  /data/zhiyu/software/nfcore/V2.7.0/rawdata   --FW_primer ACTCCTACGGGAGGCAGCA   --RV_primer GGACTACHVGGGTWTCTAAT  --email 479321347@qq.com --picrust   --kraken2_ref_tax_custom /data/changrong/save_220T_user/changrong/databases_nfcore-taxprofilers_nfcore-mag/Kraken2_database/k2_standard_20230605  --kraken2_assign_taxlevels "D,P,C,O,F,G,S"  --extension "/*_R{1,2}_001.fastq.gz" --outdir results

// 人的 https://ftp.ebi.ac.uk/pub/databases/metagenomics/mgnify_genomes/human-gut/v2.0.2/
 /data/zhiyu/software/nfcore/V2.7.0/nextflow run nf-core/ampliseq -r 2.7.0 -profile docker    --input_folder  /data/zhiyu/software/nfcore/V2.7.0/rawdata   --FW_primer ACTCCTACGGGAGGCAGCA   --RV_primer GGACTACHVGGGTWTCTAAT  --email 479321347@qq.com --picrust   --kraken2_ref_tax_custom /data/changrong/save_220T_user/changrong/UHGG_v2.0.2  --kraken2_assign_taxlevels "D,P,C,O,F,G,S"  --extension "/*_R{1,2}_001.fastq.gz" --outdir results_H
// 小鼠的 https://github.com/BenBeresfordJones/MGBC    https://zenodo.org/record/4836362/files/MGBC-26640_KrakenBracken.tar.gz?download=1  
/data/zhiyu/software/nfcore/V2.7.0/nextflow run nf-core/ampliseq -r 2.7.0 -profile docker    --input_folder  /data/zhiyu/software/nfcore/V2.7.0/rawdata   --FW_primer ACTCCTACGGGAGGCAGCA   --RV_primer GGACTACHVGGGTWTCTAAT  --email 479321347@qq.com --picrust   --kraken2_ref_tax_custom /data/changrong/save_220T_user/changrong/MGBC/MGBC-26640_KrakenBracken  --kraken2_assign_taxlevels "D,P,C,O,F,G,S"  --extension "/*_R{1,2}_001.fastq.gz" --outdir results_M

# V2.7.1 33site
/data/zhiyu/software/nfcore/V2.7.0/nextflow run /data/zhiyu/software/nfcore/V2.7.1/ampliseq   -profile singularity  -params-file nf_params.json 

