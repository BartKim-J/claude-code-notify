# Claude Code Notify

macOS용 Claude Code 알림 플러그인 - Claude 응답 완료 시 네이티브 알림

## 기능

- **두 줄 미리보기**: Claude의 마지막 응답 160자를 두 줄로 표시
- **프로젝트명 표시**: 알림 타이틀에 현재 프로젝트 폴더명 표시
- **클릭 시 앱 이동**: 알림 클릭하면 터미널/IDE로 바로 이동
- **에러 알림**: 에러 발생 시 다른 사운드로 알림
- **의존성 자동 설치**: terminal-notifier, jq 자동 설치
- **IDE 지원**: VSCode, JetBrains IDE, Cursor, Zed 등
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
git clone https://github.com/BartKim-J/claude-code-notify.git ~/.claude-code-notify && ~/.claude-code-notify/install.sh
```

## 의존성

Homebrew가 설치되어 있으면 의존성은 **자동으로 설치**됩니다.

수동 설치가 필요하면:
```bash
brew install terminal-notifier jq
```

## 알림 예시

```
┌───────────────────────────────────────────────────────┐
│ my-project                                            │ ← 프로젝트명
│ 완료! 이제 두 줄로 표시돼요. 첫 줄은 80자까지...        │ ← 첫 줄 (80자)
│ 보여주고 나머지는 여기에 표시됩니다. 총 160자...        │ ← 두번째 줄 (80자)
└───────────────────────────────────────────────────────┘
```

| 상황 | 메시지 | 사운드 |
|------|--------|--------|
| 일반 응답 | 마지막 응답 160자 (두 줄) | Glass |
| Agent 완료 | "Agent 완료" | Hero |
| 파일 수정 | "파일 수정" | Glass |
| 에러 발생 | "에러 발생!" | Basso |

## 알림 오래 유지하기

macOS 기본 설정은 알림이 빨리 사라집니다. 오래 유지하려면:

1. **시스템 설정** → **알림**
2. **terminal-notifier** 찾기
3. **알림 스타일**을 **"알림(Alerts)"** 으로 변경

이렇게 하면 수동으로 닫을 때까지 알림이 유지됩니다.

## CLI 사용법

```bash
# 기본 알림
claude-notify "작업 완료"

# 타이틀 + 서브타이틀
claude-notify "첫 줄 메시지" --title "프로젝트명" --subtitle "두번째 줄"

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
