# Load all zsh configs files
for config (~/.zsh/*.zsh) source $config

# Load all secure vars files
for var (~/.env/*.var) source $var
