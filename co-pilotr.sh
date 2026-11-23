cd ~/AnyRealm-Vision-Studio-IDE && \
node -e '
const fs = require("fs");
if (fs.existsSync("product.json")) {
  const p = JSON.parse(fs.readFileSync("product.json", "utf8"));
  p.defaultChatAgent = {
    extensionId: "pokey.cursorless",
    name: "Cursorless",
    publisher: "pokey",
    providerName: "Cursorless"
  };
  fs.writeFileSync("product.json", JSON.stringify(p, null, 2) + "\n");
}
' && \
find src/vs/platform/agentHost -type f \( -name "*.ts" -o -name "*.json" \) ! -path "*/test/*" -exec sed -i 's/github\.copilot/pokey.cursorless/g; s/copilot-chat/cursorless/g' {} + && \
git add -A && \
git commit -m "feat: preserve agentHost interfaces and bind default agent hooks to Cursorless"

