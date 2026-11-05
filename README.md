# Keychain Laalu — album landing page

A single-file, responsive landing page for **Arpit Bala's album _Keychain Laalu_** (out 11 Dec 2025), built in a hand-drawn "sketchy" style: ruled paper, wobbly borders, taped polaroid frames and marker highlights.

Pure HTML + CSS — no build step, no frameworks, no external requests.

---

## Files

```
index.html            the whole page (fonts + cover inlined as data URIs)
assets/cover.jpg      album cover, kept here for reference / social previews
.nojekyll             tells GitHub Pages to serve files as-is
```

`index.html` is fully self-contained, so it renders offline and inside sandboxed
iframes. `assets/cover.jpg` is not referenced by the page — swap the `src` of the
three `<img>` tags if you'd rather load the image as a file.

## Run it locally

Just open `index.html` in a browser, or serve the folder:

```bash
python3 -m http.server 8000
# http://localhost:8000
```

## Sections

| Section | What's in it |
| --- | --- |
| Ticker + header | Scrolling marquee, sticky nav, "listen now" CTA, mobile hamburger menu |
| Hero | Album title, blurb, CTAs, and the cover in a taped sleeve frame |
| Fine details | Release date, runtime, language, features |
| The record | Album story + a hand-written "album card" |
| Tracklist | All 9 songs with features and durations, plus the instrumentals note |
| In the room with | Producer and feature credits |
| Margin notes | Written as sample listener quotes — replace with real ones |
| Listen | Cover + links to Spotify, JioSaavn, Apple Music, YouTube Music |
| Footer | Brand, socials, link columns |

## Editing notes

- **Colours** live in `:root` at the top of the `<style>` block (`--ink`, `--paper`,
  `--indigo`, `--mustard`, `--teal`, `--coral`).
- **Fonts** are Caveat, Patrick Hand and Rubik Mono One, embedded as base64 WOFF2.
  To use CDN fonts instead, delete the three `@font-face` blocks and link Google Fonts.
- **Streaming links** in the Listen section and footer point at the real album —
  Spotify `6T7m3kftaThjsAMbZVvjp`, plus JioSaavn/Apple Music/YouTube Music searches.
- The three quotes in "Margin notes" are placeholder copy.

## Credits

Fan-made page. Music, artwork and rights belong to **Arpit Bala** and the featured
artists (sufr, pho (IND)) and producers (Adil, Angad Virk, A.O.D., Karan Kanchan,
Natiq, Toorjo Dey, NEVERSOBER).
