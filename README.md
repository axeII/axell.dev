# axell.dev
<div align="center">

### My blog

![logo](./assets/img/git-logo.png)

Blog is available at [blog.axell.dev](https://blog.axell.dev).

</div>

## ♟️ Stack

- **Generator**: [Hugo](https://gohugo.io/)
- **Theme**: [Blowfish](https://github.com/nunocoracao/blowfish)
- **Hosting**: [Cloudflare Pages](https://pages.cloudflare.com/)
- **DNS**: [Cloudflare](https://cloudflare.com/)

## 🚀 Local Development

```bash
# Serve with live reload
just dev

# Build for production
just build
```

## 📁 Structure

```
config/_default/   # Hugo configuration (params, menus, languages)
content/           # Blog posts, about, projects pages
assets/img/        # Images and logos
layouts/partials/  # Theme overrides and extensions
static/            # Static files served as-is
themes/blowfish/   # Theme submodule
```

## ℹ️ About

I wrote a post about migrating from Ghost to Hugo - read it [here](https://blog.axell.dev/favorite/why-i-migrated-from-ghost-to-hugo-and-cloudflare/).

## External Dependencies

- **Theme submodule** (`themes/blowfish`): licensed under the [MIT License](https://github.com/nunocoracao/blowfish?tab=MIT-1-ov-file)
