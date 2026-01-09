#!/bin/bash
#
# Claude Code Notify 설치 스크립트
#

set -e

INSTALL_DIR="$HOME/.claude-code-notify"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🔔 Claude Code Notify 설치 중..."

# 이미 설치된 경우 업데이트
if [[ -d "$INSTALL_DIR" ]]; then
    echo "📦 기존 설치 발견, 업데이트 중..."
    rm -rf "$INSTALL_DIR"
fi

# 복사
cp -r "$SCRIPT_DIR" "$INSTALL_DIR"

# 실행 권한
chmod +x "$INSTALL_DIR/bin/claude-notify"
chmod +x "$INSTALL_DIR/install.sh"

# 쉘 설정 파일 찾기
SHELL_RC=""
if [[ -f "$HOME/.zshrc" ]]; then
    SHELL_RC="$HOME/.zshrc"
elif [[ -f "$HOME/.bashrc" ]]; then
    SHELL_RC="$HOME/.bashrc"
elif [[ -f "$HOME/.bash_profile" ]]; then
    SHELL_RC="$HOME/.bash_profile"
fi

# PATH 추가 확인
PATH_LINE='export PATH="$HOME/.claude-code-notify/bin:$PATH"'

if [[ -n "$SHELL_RC" ]]; then
    if ! grep -q "claude-code-notify" "$SHELL_RC"; then
        echo "" >> "$SHELL_RC"
        echo "# Claude Code Notify" >> "$SHELL_RC"
        echo "$PATH_LINE" >> "$SHELL_RC"
        echo "✅ PATH 추가됨: $SHELL_RC"
    else
        echo "ℹ️  PATH 이미 설정됨"
    fi
else
    echo "⚠️  쉘 설정 파일을 찾을 수 없습니다. 수동으로 PATH를 추가하세요:"
    echo "   $PATH_LINE"
fi

echo ""
echo "✅ 설치 완료!"
echo ""
echo "📌 다음 단계:"
echo "   1. 터미널 재시작 또는: source $SHELL_RC"
echo "   2. 테스트: claude-notify '테스트 알림'"
echo ""
echo "📝 Claude Code에서 사용하려면 ~/.claude/settings.json에 추가:"
echo '   {
     "hooks": {
       "Stop": [
         {
           "hooks": [
             {
               "type": "command",
               "command": "claude-notify '\''응답 완료'\''"
             }
           ]
         }
       ]
     }
   }'
