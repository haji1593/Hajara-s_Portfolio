---
title: "Public Sentiment on the US–Israel–Iran Conflict"
summary: "NLP on 13K+ posts across 7 platforms — VADER/TextBlob sentiment, LDA topics, and an 82%-accuracy classifier — shipped as a live Streamlit app."
category: "NLP"
date: "2026"
tags: ["Python", "NLTK", "scikit-learn", "VADER", "TextBlob", "LDA", "Logistic Regression", "K-Means", "Streamlit"]
cover: "/projects/sentiment-cover.png"
repo: ""        # TODO: link the GitHub repo
demo: "https://nlpsentimenttopic-us-israel.streamlit.app/"
embed: "https://nlpsentimenttopic-us-israel.streamlit.app/?embed=true"
featured: true
order: 1
draft: false
---

## The question

When the US–Israel–Iran conflict escalated, social media and newsrooms filled with
reaction faster than any survey could capture. **What were people actually feeling,
which themes dominated, and does professional journalism frame the war differently
from the public?**

## The data

A corpus of **13,046 texts** collected from **seven sources** — a traditional news
feed (NewsAPI) plus Facebook, Twitter/X, YouTube, Reddit, TikTok, and Instagram —
over April–May 2025. After a full cleaning pipeline (emoji-to-text, URL/mention
stripping, language filtering, lemmatisation), **9,119 documents** remained.
Language detection alone removed **30%** of the raw corpus, mostly non-English
TikTok and Facebook comments.

## Approach

**1 · Preprocessing.** A 7-step pipeline with POS-aware WordNet lemmatisation and a
custom stop-word list (179 NLTK words plus platform noise like *rt, amp, subscribe,
sticker*) to normalise text from seven very different platforms.

**2 · Sentiment — two lexicons.** **VADER** (tuned for social media) and **TextBlob**
scored every document, used together so neither lexicon's blind spots went
unchecked.

**3 · Topic modeling.** **LDA** (scikit-learn, `random_state=122`, CountVectorizer
with uni/bi-grams) surfaced six coherent topics.

**4 · Supervised + unsupervised checks.** A **Logistic Regression** classifier
(TF-IDF, 80/20 split) trained on the lexicon labels, and **K-Means** (k=5) to confirm
the themes held up without any labels.

## What I found

- **The corpus skews negative.** VADER mean compound **−0.276**: **59% negative**,
  25% positive, 16% neutral.
- **News is far more negative than the public.** Traditional news averaged
  **−0.645** (83% negative) vs **−0.230** for social media — a **0.415-point gap**.
  Twitter/X mirrored the news at −0.618.
- **Diplomacy dominated the conversation.** LDA's six topics were led by
  **Diplomatic Negotiations at 44%** of the corpus, ahead of nuclear narratives,
  political leadership, regional/proxy conflict, military operations, and energy markets.
- **Military and media/propaganda were the most charged dimensions** (−0.589 and
  −0.581), while **69.7%** of support-vs-opposition text leaned anti-war.
- **The lexicons disagree by design.** TextBlob read the same news content as 63%
  positive where VADER read 83% negative — a concrete lesson in why one sentiment
  tool is never enough.
- **The classifier validated the labels.** Logistic Regression hit **82% accuracy**
  under both VADER and TextBlob labelling, and K-Means (k=5) recovered the same
  thematic structure.

## Why it matters

Sentiment plus topics together tell you more than either alone: *how* people feel
**and** *what* they're reacting to, *and* how the framing shifts between professional
and grassroots voices. That's exactly what a newsroom, brand, or policy team needs to
read a fast-moving public conversation — and it's all explorable in the live app
below.

## Tech

`Python` · `NLTK` · `scikit-learn` · `VADER` · `TextBlob` · `LDA` ·
`Logistic Regression` · `K-Means` · `Streamlit`
