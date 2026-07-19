# Commit Convention

This repo follows [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>: <short, imperative description>
```

## Types

- `feat:` — a new feature (e.g. `feat: add score keeper`)
- `fix:` — a bug fix (e.g. `fix: quiz no longer skips last question`)
- `chore:` — maintenance, deps, config (e.g. `chore: update pubspec dependencies`)
- `docs:` — documentation only (e.g. `docs: update README with setup steps`)
- `style:` — formatting, no logic change
- `refactor:` — code change that's neither a fix nor a feature
- `test:` — adding or fixing tests

## Guidelines

- Use imperative mood: "add", not "added" or "adding"
- Keep the summary line under ~50 characters
- Keep commits atomic — one logical change per commit
- Scope the message to what actually changed (e.g. don't call it an "Android" commit if it touches all platforms)
