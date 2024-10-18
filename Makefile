.PHONY: website

website:
	pandoc --standalone \
				 --from commonmark_x+alerts \
         --output=website/index.html \
         --template=pandoc/template.html4 \
         --css=style.css \
         --toc \
         --toc-depth=1 \
         --resource-path=. \
         src/index.md
