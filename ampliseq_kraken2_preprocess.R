library(phyloseq)
library(dplyr)
library(tidyr)

##
kraken2_phyloseq <- readRDS("kraken2_phyloseq.rds")

tax_table_df <- as.data.frame(tax_table(kraken2_phyloseq))

# Create new columns by separating the 'taxonomy' column
tax_table_df <- tax_table_df %>%
  separate(taxonomy, into = c("Kingdom", "Phylum", "Class", "Order", "Family", "Genus", "Species"), sep = ";", fill = "right")

# Replace empty strings with NA (optional)
tax_table_df <- tax_table_df %>%
  mutate(across(everything(), ~na_if(., "")))

# Update the phyloseq object with the new tax_table
tax_table(kraken2_phyloseq) <- tax_table(as.matrix(tax_table_df))

# Check the updated phyloseq object
ps_filtered <- subset_taxa(kraken2_phyloseq, !is.na(Phylum) & !Phylum == "" )

# 
saveRDS(ps_filtered, file = "kraken2_phyloseq_updated.rds")
