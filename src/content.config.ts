import { defineCollection, z } from "astro:content";
import { glob } from "astro/loaders";

// =============================================================================
// PROJECTS COLLECTION
// To add a project: copy any file in src/content/projects/ and edit it.
// Set draft: true to hide one while you work on it.
// =============================================================================
const projects = defineCollection({
  loader: glob({ pattern: "**/*.md", base: "./src/content/projects" }),
  schema: z.object({
    title: z.string(),
    // One-line outcome shown on the card. Lead with a number when you can.
    summary: z.string(),
    // Short category label — also used to group the Projects page.
    category: z.enum(["NLP", "Analytics", "Power BI", "Data Systems"]),
    date: z.string(), // e.g. "2026" or "Aug 2025"
    tags: z.array(z.string()),
    // Card image: put it in /public/projects/ and reference "/projects/x.png"
    cover: z.string().optional(),
    // Extra screenshots shown as a gallery on the detail page (e.g. multi-page
    // Power BI dashboards). First item can repeat the cover.
    gallery: z.array(z.string()).optional(),
    repo: z.string().optional(),
    demo: z.string().optional(),
    // Live app to embed as an iframe on the detail page (e.g. a Streamlit URL).
    embed: z.string().optional(),
    // Downloadable file shown as a button on the detail page (e.g. a .sql schema).
    sql: z.string().optional(),
    featured: z.boolean().default(false),
    order: z.number().default(99),
    draft: z.boolean().default(false),
  }),
});

export const collections = { projects };
