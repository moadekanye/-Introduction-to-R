# Load the sequence file
file_path <- "/mnt/data/chr1_GL383518v1_alt.fa"
sequence <- readLines(file_path)
sequence <- sequence[2] # Assuming the sequence starts from the second line after the header

# Print the 10th letter
cat("10th letter:", substr(sequence, 10, 10), "\n")

# Print the 758th letter
cat("758th letter:", substr(sequence, 758, 758), "\n")

# Part 2: Create the reverse complement of the sequence

# Function to generate reverse complement
reverse_complement <- function(seq) {
  # Replace each base with its complement
  complemented <- chartr("ATGC", "TACG", seq)
  # Reverse the complemented sequence
  return(rev(strsplit(complemented, NULL)[[1]]))
}

# Get the reverse complement
reverse_seq <- paste(reverse_complement(sequence), collapse = "")

# Print the 79th letter of reverse complement
cat("79th letter of reverse complement:", substr(reverse_seq, 79, 79), "\n")

# Print the 500th to 800th letters of reverse complement
cat("500th to 800th letters of reverse complement:", substr(reverse_seq, 500, 800), "\n")

# Part 3: Count nucleotides for each kilobase in the sequence

# Split the sequence into kilobase segments and count nucleotides
sequence_length <- nchar(sequence)
kilobase_counts <- list()

for (i in seq(1, sequence_length, by = 1000)) {
  # Extract a kilobase segment
  kilobase <- substr(sequence, i, min(i + 999, sequence_length))
  # Count the occurrences of each nucleotide in the kilobase
  counts <- table(strsplit(kilobase, NULL)[[1]])
  kilobase_counts[[length(kilobase_counts) + 1]] <- counts
}

# Part 4: Create a Data Frame and Calculate Sums for Each Kilobase

# Create a data frame for the first kilobase
kilobase_1 <- as.integer(kilobase_counts[[1]][c("A", "C", "G", "T")])
df <- data.frame(A = kilobase_1[1], C = kilobase_1[2], G = kilobase_1[3], T = kilobase_1[4])

# Add each kilobase counts to the data frame
for (i in 2:length(kilobase_counts)) {
  counts <- as.integer(kilobase_counts[[i]][c("A", "C", "G", "T")])
  df <- rbind(df, data.frame(A = counts[1], C = counts[2], G = counts[3], T = counts[4]))
}

# Calculate the sum of each row
df$Sum <- rowSums(df)

# Expected sum for each kilobase
# Each kilobase is expected to contain 1000 base pairs, so the expected sum is 1000.
expected_sum <- 1000

# Check for discrepancies
discrepancies <- which(df$Sum != expected_sum)
cat("Expected sum:", expected_sum, "\n")
cat("Discrepant kilobases:", discrepancies, "\n")

# Explanation:
# - The expected sum for each list is 1000, as each kilobase is expected to contain 1000 bases.
# - If there are any lists whose sums are not equal to 1000, it may indicate that those kilobase segments
#   are incomplete. This usually happens at the end of the sequence where the last segment may contain
#   fewer than 1000 bases if the total length of the sequence is not a multiple of 1000.
# - Thus, differences between the expected and observed results are likely due to the final segment
#   of the sequence being shorter than 1000 bases, rather than an error in the sequence itself.
