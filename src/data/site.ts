// =============================================================================
// SITE CONFIG — edit this one file to update your name, links, and contact.
// Anything marked TODO needs your real value before you go live.
// =============================================================================

export const site = {
  name: "Hajara Abdul Mumin",
  // Short name used in the top-left logo / nav
  shortName: "Hajara",

  // The two roles this portfolio targets. (AI engineering intentionally omitted.)
  roles: ["Data Scientist", "ML Engineer"],

  // One-line hero tagline. Swap for any of the alternates in the comment below.
  tagline: "I turn messy, real-world data into models and decisions people can act on.",
  // Alternates:
  //  - "Data scientist building models that earn their place in a decision."
  //  - "From raw data to a model someone can actually use."

  location: "Accra, Ghana",

  // ---- Contact / links -------------------------------------------------------
  // TODO: pick ONE professional email to show publicly.
  email: "dauditor93@gmail.com",

  // TODO: add your real profile URLs (leave "" to hide a link).
  github: "https://github.com/haji1593",
  linkedin: "https://www.linkedin.com/in/hajara-abdul-mumin-035451173/",
  kaggle: "", // optional

  // Resume: drop your PDF in /public and set the filename here.
  // TODO: export your one-page CV to PDF and place it at public/Hajara_Abdul_Mumin_CV.pdf
  resumePdf: "/Hajara_Abdul_Mumin_CV.pdf",
} as const;

export const nav = [
  { label: "About", href: "/#about" },
  { label: "Projects", href: "/projects" },
  { label: "Resume", href: "/resume" },
  { label: "Contact", href: "/#contact" },
] as const;
