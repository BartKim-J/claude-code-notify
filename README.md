# Claude Code Notify

macOS용 Claude Code 알림 플러그인

## 설치

```bash
# 리포 클론
git clone https://github.com/YOUR_USERNAME/claude-code-notify.git ~/.claude-code-notify

# 설치 스크립트 실행
~/.claude-code-notify/install.sh
```

## 수동 설치

```bash
# PATH에 추가 (~/.zshrc 또는 ~/.bashrc)
export PATH="$HOME/.claude-code-notify/bin:$PATH"
```

## 사용법

### CLI 직접 사용

```bash
# 기본 알림
claude-notify "작업 완료"

# 타이틀 지정
claude-notify "빌드 성공" --title "CI"

# 사운드 지정
claude-notify "테스트 통과" --sound "Glass"

# 사운드 끄기
claude-notify "조용히 완료" --silent
```

### Claude Code Hooks 설정

프로젝트의 `.claude/settings.json`:

```json
{
  "hooks": {
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "claude-notify '응답 완료'"
          }
        ]
      }
    ]
  }
}
```

또는 전역 설정 `~/.claude/settings.json`:

```json
{
  "hooks": {
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "claude-notify '응답 완료' --sound Glass"
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Task",
        "hooks": [
          {
            "type": "command",
            "command": "claude-notify 'Task 에이전트 완료' --title 'Agent'"
          }
        ]
      }
    ]
  }
}
```

## 사용 가능한 사운드

- `Glass` (기본값)
- `Ping`
- `Pop`
- `Purr`
- `Submarine`
- `Blow`
- `Bottle`
- `Frog`
- `Funk`
- `Hero`
- `Morse`
- `Tink`

## Hook 이벤트 종류

| 이벤트 | 설명 |
|--------|------|
| `Stop` | Claude 응답 완료 시 |
| `PostToolUse` | 도구 사용 후 |
| `Notification` | Claude가 알림 보낼 때 |
| `PreToolUse` | 도구 사용 전 |

## 설정 파일 위치

- 프로젝트별: `.claude/settings.json`
- 전역: `~/.claude/settings.json`

## 라이선스

MIT
