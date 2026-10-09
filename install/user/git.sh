# Set identification from install inputs
if [[ -n ${BERU_USER_NAME//[[:space:]]/} ]]; then
  git config --global user.name "$BERU_USER_NAME"
fi

if [[ -n ${BERU_USER_EMAIL//[[:space:]]/} ]]; then
  git config --global user.email "$BERU_USER_EMAIL"
fi
