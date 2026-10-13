#!/usr/bin/env bash
set -euo pipefail
rm -rf public .aura-build
mkdir -p public .aura-build/chunks
ids=(
1XRtKUL2s3bo4Gn8jvcu1gvLkQXvDvGpe
1iHhthOXU3sW9p_j8yzjZCq2v9Dp_OKjD
1Wo_P0X8o3uheH_9eyt-UcmctCY_m-WrK
1voqCM9lAQsmM0C0_5IsdVV3ytpmNPWhW
1ajoCFfqokfUT9s52KEAhkpLA3c5f3lme
1XTXkC9p7yDSpjD367bcGARnq6v6JOkDE
1r8EsfZSNUKs8au7joQOsRkzZRaz6ZZcX
1HwAnByrHtzKMlViemVP8rusiVMcjFHTA
19j-IWKBYeiPYJfPuPeLxWP-kelj5XamS
1iSS2qp0jdRRBJ92g35aygxlhxcCsekQ6
1F8hDVkGKu2hguxG9RTJUbJsgTFDFhsY9
15XSYhbfMp_eFdKjCQV-rsXlhYfoQ6y0i
1Ks5JaWabqZPk2EmpviQWHfbA1eQvE0Ve
1LXDUVaCNCI66pWTvaXgRmhbhR_EIJUaV
1h_Ih7rcaZyXJLif5UzLqnFNQGOnYm4Qm
1uO5ezus877lKzARGuFWz5JZ6sZkS_SNU
1Ly3gTUxwrALudZplzJHMPiq6wN6sEsVV
1b-_nb9iG1HjD5tWdOViKlMQ-cj6SGCQd
1ohDQ9V8tlN36ex_nd7j_myK6Bsfkr6B7
1U4xjI4bXrkmJ4iwCQLFNju6WIF29KMry
16G7visR3QiFaQiTG6AMjNSHZ0GZZFLVJ
1ddop8NyXowoEzsvFXuhYTpWsCgtmUOjG
16gEbIP62avDIHdLUk_AxcKK4nw9Zi6De
)
for i in "${!ids[@]}"; do
  n=$(printf '%03d' "$i")
  id="${ids[$i]}"
  echo "Downloading AURA production chunk $n..."
  curl -fL --retry 4 --retry-delay 2 "https://drive.usercontent.google.com/download?id=${id}&export=download&confirm=t" -o ".aura-build/chunks/aura_full.part${n}"
done
cat .aura-build/chunks/aura_full.part* > .aura-build/AURA_INC_PRODUCTION_FULL.zip
unzip -q .aura-build/AURA_INC_PRODUCTION_FULL.zip -d public
printf 'User-agent: *\nAllow: /\n' > public/robots.txt
find public/institute_docs -type f -name 'doc_*.pdf' | wc -l
