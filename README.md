# -Introduction-to-R
# DNA Sequence Analysis Script

## Author and Script Information
- **Programmer**: Mo Adekanye
- **Script Language**: R
- **R Version**: 4.1.0 (or specify the version you are using)
- **Date Submitted**: November 10, 2024
- **Description**: This R script performs various analyses on a DNA sequence file (`chr1_GL383518v1_alt.fa`). The script reads the DNA sequence, retrieves specific nucleotides, generates the reverse complement, and performs a nucleotide frequency analysis for each kilobase (1000 base pairs) segment. Additionally, the script checks for discrepancies in kilobase segment lengths, highlighting segments that deviate from the expected length of 1000 bases.

## Required Files
- **`chr1_GL383518v1_alt.fa`**: The DNA sequence file in FASTA format, which contains the reference sequence for `chr1_GL383518v1_alt`. The file is used as input for reading and analyzing the DNA sequence data.

## Required Libraries
The script relies on base R functionality and does not require any additional packages or libraries.

## Instructions for Running the Script
1. **Setup**: Ensure you have R installed on your machine. The script is compatible with R version 4.1.0 and later, though it may work with earlier versions as well.
   
2. **Download Files**: Place the `chr1_GL383518v1_alt.fa` file in the same directory as the script or specify the path to the file in the script under `file_path`.
   
3. **Run the Script**:
   - Open R or RStudio.
   - Set the working directory to the location where the script and `chr1_GL383518v1_alt.fa` are stored.
   - Run the script by sourcing it or by executing each part sequentially:
     ```R
     source("your_script.R")
     ```
   - Alternatively, you can copy and paste the script code into the R console.

4. **Script Output**:
   - **Printed Output**: The script will print the 10th, 758th, and 79th letters of the original and reverse complement sequences, as well as the 500th through 800th letters of the reverse complement sequence.
   - **Data Frame Output**: A data frame (`df`) is created containing nucleotide counts (A, C, G, T) for each kilobase segment in the sequence.
   - **Sum Calculation**: The script calculates and outputs the sum of nucleotide counts for each kilobase segment, and identifies any segments where the count deviates from the expected 1000 base pairs.


## Additional Notes
- This script is designed to handle sequences up to several million base pairs efficiently but may require optimization or adjustments for significantly longer sequences.
- Ensure the `chr1_GL383518v1_alt.fa` file follows the standard FASTA format where the sequence starts on the second line, following the header.
