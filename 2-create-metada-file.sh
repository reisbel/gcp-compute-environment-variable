cat | envsubst '$CUSTOM_VARIABLE' > startup.ps1 << 'EOF'
# Add environment variable
[Environment]::SetEnvironmentVariable( `
  "CUSTOM_VARIABLE", "$CUSTOM_VARIABLE", `
  [System.EnvironmentVariableTarget]::Machine)
EOF