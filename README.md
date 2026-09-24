# Discover the Grammar

A browser-based logic game about inferring a hidden grammar. Instead of words, the "sentences" are sequences of playing cards. A hidden set of rules decides which sequences are valid, and you design experiments to work out those rules and then propose your answer.

Built with AI coding assistance.

## The three layers

| Layer | Name | What you do |
|---|---|---|
| 1 | **The Base Game** | Deduce the grammar of static 3-card sentences. Rules are built from three features (suit, parity, size), such as "Pos 1 & 3 Match". You choose 1, 2, or 3 active features and can hide which features are active. |
| 2 | **Clause Chaining** | Sentences are chains of clauses that share a pivot card (2 clauses = 5 cards, 3 clauses = 7 cards). The pivot can carry the grammar over (SS) or change it (DS). |
| 3 | **Syntax Trees** | Merge cards into phrases and bridge phrases into sentences, spending tokens to test each relationship. Deduce the merge, head, and bridge rules (plus percolation in Classic mode), then complete the Construction Challenge by building 4-, 6-, and 8-card sentences. |

## Play

No build step or server is needed. Open `index.html` in a browser.

## Publish with GitHub Pages

1. Push these files to a GitHub repository.
2. In the repository, go to **Settings → Pages**.
3. Under **Build and deployment**, choose **Deploy from a branch**, select `main` and `/ (root)`, and save.

## Files

| File | Purpose |
|---|---|
| `index.html` | Page markup for all three layers |
| `style.css` | Styling |
| `js/shared.js` | Shared card utilities and the grammar logic used by Layers 1 and 2 |
| `js/layer1.js` | Layer 1 engine |
| `js/layer2.js` | Layer 2 engine |
| `js/layer3.js` | Layer 3 engine and Construction Challenge |

The scripts are plain (non-module) scripts and must load in the order shown in `index.html`.
