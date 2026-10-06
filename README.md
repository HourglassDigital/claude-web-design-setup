# The free Claude web design setup we use

From the team at [Hourglass AI](https://thehourglass.ai). One script installs all five.

## Quick install

```
curl -fsSL https://raw.githubusercontent.com/HourglassDigital/claude-web-design-setup/main/install.sh | bash
```

Or pick a brand style for awesome-design-md at the same time (swap `stripe` for any brand in the library):

```
curl -fsSL https://raw.githubusercontent.com/HourglassDigital/claude-web-design-setup/main/install.sh | bash -s -- stripe
```

Run it from your project folder. Prefer to do it by hand? Every command is below.

Out of the box, Claude Code builds websites that all look the same: Inter font, purple gradients, cards inside cards.
These five free add-ons fix that. Install them once and every site you build after that gets them.

**Before you start:** you need Claude Code installed and Node.js 18 or newer (the `npx` and `npm` commands come with Node). Run each command in your terminal from your project folder unless it says otherwise. Checked against each tool's own GitHub page on 6 October 2026, and the install script tested end to end on macOS the same day.

---

## 1. Impeccable

**What it does:** gives Claude a design vocabulary of 24 commands (`polish`, `audit`, `critique`, `typeset`, `layout` and more) plus 60 automatic checks that catch the usual AI design tells.
**Made by:** Paul Bakaus
**Cost:** free, open source (Apache 2.0)

Install (from your project folder):

```
npx impeccable install
```

Or inside Claude Code, add it as a plugin, then open `/plugin` and install Impeccable from the list:

```
/plugin marketplace add pbakaus/impeccable
```

Then, once per project, inside Claude Code:

```
/impeccable init
```

Try: `/impeccable critique landing` or `/impeccable polish`

Source: https://github.com/pbakaus/impeccable

---

## 2. Taste Skill

**What it does:** a set of skills that push Claude toward stronger layout, type, spacing and motion. The main one has three dials (how experimental the layout is, how much animation, how dense the page is). There are also style packs: minimalist, soft premium, and brutalist.
**Made by:** Leonxlnx (Leon)
**Cost:** free, open source (MIT)

Install all of them:

```
npx skills add https://github.com/Leonxlnx/taste-skill
```

Or just the main one:

```
npx skills add https://github.com/Leonxlnx/taste-skill --skill "design-taste-frontend"
```

Try: `Use the design-taste-frontend skill to build a landing page for a local coffee roaster.`

Source: https://github.com/Leonxlnx/taste-skill

---

## 3. Emil Kowalski's skills

**What it does:** animation and interface rules from the designer behind Sonner and Vaul. Fixes the small things AI gets wrong, like the wrong easing on an animation, and includes skills to review your animations and stress-test your UI with messy data.
**Made by:** Emil Kowalski
**Cost:** free, open source (MIT)

Install:

```
npx skills@latest add emilkowalski/skills
```

Try: `Use the review-animations skill on this page and fix what it finds.`

Source: https://github.com/emilkowalski/skills

---

## 4. awesome-design-md

**What it does:** a library of ready-made DESIGN.md files, each describing how a real brand's website looks (colours, fonts, buttons, spacing, do's and don'ts). Claude reads the file and builds in that style.
**Made by:** VoltAgent
**Cost:** free, open source (MIT)

Brands in the library include Apple, Stripe, Linear, Notion, Vercel, Airbnb, Spotify, Tesla, Nike and Figma (around 70 in total).

How to use one:

1. Pick a brand from the list on the GitHub page.
2. Get its DESIGN.md into the root of your project. Either download it from the brand's page, or run (swap `stripe` for the brand you want):

```
npx getdesign@latest add stripe
```

3. Tell Claude to use it.

Try: `Read DESIGN.md and build me a pricing page that follows it.`

Note: these are inspired-by style guides. Use them for the feel, do not copy a real company's logo or brand.

Source: https://github.com/VoltAgent/awesome-design-md

---

## 5. Playwright CLI

**What it does:** lets Claude open your site in a real browser, click through it and take screenshots, so it can check its own work instead of guessing.
**Made by:** Microsoft
**Cost:** free, open source (Apache 2.0)

Install:

```
npm install -g @playwright/cli@latest
playwright-cli install --skills
```

Microsoft recommends the CLI over the Playwright MCP for coding agents like Claude Code because it uses fewer tokens. If you prefer the MCP version:

```
claude mcp add playwright npx @playwright/mcp@latest
```

Try: `Use playwright-cli to open my site at localhost:3000, screenshot it on desktop and mobile, and fix anything that looks broken.`

Source: https://github.com/microsoft/playwright-cli

---

## Optional: Figma MCP

**What it does:** lets Claude read your Figma designs (components, colours, layout) and turn a selected frame into code.
**Made by:** Figma
**Cost:** needs a paid plan for real use. The free Starter plan allows only 20 tool calls a month. A paid plan with a Dev or Full seat allows 200 a day on Professional.

Install (in your terminal):

```
claude plugin install figma@claude-plugins-official
```

Source: https://help.figma.com/hc/en-us/articles/39888612464151

---

## First prompt to try

Once everything is installed, open Claude Code in an empty folder and paste:

```
Build a one-page website for a local coffee roaster.
Read DESIGN.md and follow it.
Use the design-taste-frontend skill for layout and type.
When it's built, use playwright-cli to screenshot it on desktop and mobile.
Then run /impeccable critique and fix the top three issues it finds.
```

---

## What each one fixes

| Tool | What it fixes |
|---|---|
| Impeccable | Generic AI look: same fonts, gradients, nested cards. Gives you commands to critique and polish |
| Taste Skill | Boring, template layouts. Sets how bold, animated and dense the page is |
| Emil Kowalski's skills | Animations that feel off, and UI that breaks with real data |
| awesome-design-md | No clear style. Gives Claude a full design system to follow |
| Playwright CLI | Claude can't see what it built. Now it screenshots and checks |
| Figma MCP (optional) | Rebuilding Figma designs by hand. Claude reads the file directly |
