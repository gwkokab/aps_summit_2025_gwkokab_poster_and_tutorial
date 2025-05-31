import os
import pandas as pd
import glob

# Set your directory containing the .dat files
data_dir = "./data/realization_0"

def check_mass_order(file_path):
    try:
        df = pd.read_csv(file_path, sep=r'\s+')
        m1 = df["mass_1_source"]
        m2 = df["mass_2_source"]

        violations = m1 <= m2
        num_violations = violations.sum()
        total = len(df)

        if num_violations > 0:
            print(f"❌ {file_path}: {num_violations}/{total} rows where m1 ≤ m2")
            # Optionally print some problematic rows
            # print(df[violations].head())
        else:
            print(f"✅ {file_path}: All {total} rows passed (m1 > m2)")

    except Exception as e:
        print(f"⚠️ Error reading {file_path}: {e}")

# Check all .dat files in the directory
dat_files = glob.glob(os.path.join(data_dir, "injections.dat"))

for f in dat_files:
    check_mass_order(f)
