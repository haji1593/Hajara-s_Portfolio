---
title: "Public Sentiment on the US–Israel–Iran Conflict"
summary: "Mined social-media reaction to the conflict with VADER + TextBlob sentiment and LDA/LSI topic modeling."
category: "NLP"
date: "2026"
tags: ["Python", "NLTK", "scikit-learn", "Gensim", "VADER", "TextBlob", "Streamlit"]
cover: "/projects/sentiment-cover.svg"
repo: ""        # TODO: link the GitHub repo
demo: ""        # TODO: link the Streamlit app if deployed
featured: true
order: 1
draft: false
---

## The question

When the US–Israel–Iran conflict escalated, social media filled with reaction
faster than any survey could capture. **What were people actually feeling, and
what themes were they talking about?** I set out to measure the emotional tone
of the conversation and surface the dominant topics underneath it.

## The data

A corpus of social-media posts referencing the conflict, collected over
‹TODO: time window› and totalling **‹TODO: N›** posts after de-duplication.

## Approach

I followed a disciplined NLP pipeline so the results were reproducible end to end.

**1 · Text preprocessing (7 steps).** Lowercasing → regex cleaning of non-letters
→ whitespace normalisation → tokenisation → stop-word removal →
POS tagging → POS-aware lemmatisation. POS-aware lemmatisation matters: it
collapses *running / ran / runs* to the same root **only when the part of speech
agrees**, which keeps the vocabulary tight without distorting meaning.

**2 · Sentiment scoring.** Each post was scored with **two** lexicon models —
VADER (tuned for social-media tone and emoji) and TextBlob (polarity +
subjectivity). Using both let me cross-check rather than trust a single lexicon.

**3 · Topic modeling — two lenses.**
- **LDA** on a `CountVectorizer` matrix to find probabilistic themes.
- **LSI** (TF-IDF + Truncated SVD) to capture the latent semantic structure.

Running both is the point: where LDA and LSI agree on a theme, I trusted it more.

## What I found

- The overall sentiment skewed **‹TODO: e.g. negative — 58% negative, 27% neutral, 15% positive›**.
- Topic modeling surfaced **‹TODO: k›** recurring themes, the clearest being
  **‹TODO: e.g. civilian impact, diplomatic response, energy-market fear›**.
- ‹TODO: one sentence on the most interesting or counter-intuitive finding.›

> Replace the ‹TODO› lines above with your real figures from the notebook, then
> delete this quote block.

## Why it matters

Sentiment plus topics together tell you more than either alone: *how* people feel
**and** *what* they're reacting to. That pairing is exactly what a brand,
newsroom, or policy team needs to read a fast-moving public conversation.

## Tech

`Python` · `NLTK` · `scikit-learn` · `Gensim` · `VADER` · `TextBlob` ·
`Matplotlib` / `Seaborn` · `Streamlit`
