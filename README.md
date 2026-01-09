# Claude Code Notify

macOS용 Claude Code 알림 플러그인 - Claude 응답 완료 시 네이티브 알림

## 기능

- **프로젝트명 표시**: 알림 타이틀에 현재 프로젝트 폴더명 표시
- **마지막 응답 미리보기**: Claude의 마지막 응답 50자를 알림에 표시
- **클릭 시 앱 이동**: 알림 클릭하면 터미널/IDE로 바로 이동
- **에러 알림**: 에러 발생 시 다른 사운드로 알림
- **IDE 지원**: VSCode, JetBrains IDE, Cursor, Zed 등 지원
- **터미널 지원**: iTerm2, Ghostty, Alacritty, kitty, WezTerm, Terminal.app

## 설치

### 방법 1: 플러그인 (권장)

```bash
# Claude Code에서 실행
/plugin marketplace add BartKim-J/claude-code-notify
/plugin install macos-notify@bartkim-claude-plugins
```

### 방법 2: 수동 설치

```bash
git clone https://github.com/BartKim-J/claude-code-notify.git ~/.claude-code-notify
~/.claude-code-notify/install.sh
```

## 의존성

의존성은 **자동으로 설치**됩니다. 수동 설치가 필요하면:

```bash
brew install terminal-notifier jq
```

## 알림 예시

```
┌─────────────────────────────────────────┐
│ my-project                              │  ← 프로젝트 폴더명
│ 좋아요, 마지막 응답을 가져올 수 있어요...  │  ← 마지막 응답 미리보기
└─────────────────────────────────────────┘
```

| 상황 | 메시지 | 사운드 |
|------|--------|--------|
| 일반 응답 | 마지막 응답 50자 | Glass |
| Agent 완료 | "Agent 완료" | Hero |
| 파일 수정 | "파일 수정" | Glass |
| 에러 발생 | "에러 발생!" | Basso |

## CLI 사용법

```bash
# 기본 알림
claude-notify "작업 완료"

# 타이틀 지정
claude-notify "빌드 성공" --title "CI"

# 사운드 지정
claude-notify "테스트 통과" --sound Hero

# 클릭 시 앱 이동 끄기
claude-notify "완료" --no-activate
```

## 수동 Hook 설정

플러그인 대신 직접 설정하려면 `~/.claude/settings.json`:

```json
{
  "hooks": {
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "~/.claude-code-notify/bin/claude-notify-hook"
          }
        ]
      }
    ]
  }
}
```

## 사용 가능한 사운드

`Glass` (기본), `Ping`, `Pop`, `Purr`, `Submarine`, `Blow`, `Bottle`, `Frog`, `Funk`, `Hero`, `Morse`, `Tink`, `Basso`

## 요구사항

- macOS
- Claude Code CLI
- Homebrew (의존성 자동 설치용)

## 라이선스

MIT
