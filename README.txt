# NF_ampliseq 2.5.0
https://github.com/nf-core/ampliseq  
https://nf-co.re/docs/usage/installation

./nextflow run /home/yuafen/data/software/nfcore-ampliseq-2.5.0/ampliseq-2.5.0/  -profile docker -params-file /home/yuafen/data/test/test3/nf-params.json --FW_primer ACTCCTACGGGAGGCAGCA   --RV_primer GGACTACHVGGGTWTCTAAT  --classifier "/data2/zhiyu/software/nfcore/v2.4.0/silva-138-ssu-nr99-338f-806r-20210804-binbinzhao-classifier.qza"

# NF_ampliseq 2.7.0
#./nextflow run nf-core/ampliseq -r 2.7.0 -profile docker  --outdir ceshi2 --input_folder  /data/zhiyu/software/nfcore/V2.7.0/rawdata --FW_primer CCTACGGGNGGCWGCA --RV_primer GACTACHVGGGTATCTAAT --email 479321347@qq.com --picrust  --kraken2_ref_taxonomy silva=138

/data/zhiyu/software/nfcore/V2.7.0/nextflow run nf-core/ampliseq -r 2.7.0 -profile docker    --input_folder  /data/zhiyu/software/nfcore/V2.7.0/rawdata   --FW_primer ACTCCTACGGGAGGCAGCA   --RV_primer GGACTACHVGGGTWTCTAAT  --email 479321347@qq.com --picrust   --kraken2_ref_tax_custom https://genome-idx.s3.amazonaws.com/kraken/k2_standard_20230605.tar.gz  --kraken2_assign_taxlevels "D,P,C,O,F,G,S"  --extension "/*_R{1,2}_001.fastq.gz" --outdir results

/data/zhiyu/software/nfcore/V2.7.0/nextflow run nf-core/ampliseq -r 2.7.0 -profile docker    --input_folder  /data/zhiyu/software/nfcore/V2.7.0/rawdata   --FW_primer ACTCCTACGGGAGGCAGCA   --RV_primer GGACTACHVGGGTWTCTAAT  --email 479321347@qq.com --picrust   --kraken2_ref_tax_custom /data/changrong/save_220T_user/changrong/databases_nfcore-taxprofilers_nfcore-mag/Kraken2_database/k2_standard_20230605  --kraken2_assign_taxlevels "D,P,C,O,F,G,S"  --extension "/*_R{1,2}_001.fastq.gz" --outdir results


