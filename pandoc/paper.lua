function CodeBlock(el)

  if el.classes[1] == "paper" then
    local content = string.format("{ %s }", el.text)
    local data = pandoc.json.decode(content, false)

    if not data then
      error("Failed to decode JSON:\n" .. el.text)
    end

    local title = data.title or ""
    local url = data.url
    local authors = data.authors or ""
    local venue = data.venue
    local year = data.year
    local files = data.files or pandoc.List()

    local header = {}

    if url then
      header = { pandoc.Link(title, url) }
    else
      header = { pandoc.Str(title) }
    end

    local sub = {}

    if venue and year then
      sub = { pandoc.Str(string.format("%s (%s)", venue, year)) }
    elseif venue then
      sub = { pandoc.Str(venue) }
    elseif year then
      sub = { pandoc.Str(year) }
    end

    local file_info = files:map(function(data)
      local s = data.text or ""
      local type = data.type
      local src = data.src or ""

      local icon = ""

      if type == "pdf" then
        icon = "<i class=\"fa-solid fa-file-pdf\"></i>"
      elseif type == "bib" then
        icon = "<i class=\"fa-solid fa-quote-left\"></i>"
      elseif type == "code" then
        icon = "<i class=\"fa-solid fa-file-code\"></i>"
      elseif type == "video" then
        icon = "<i class=\"fa-solid fa-file-video\"></i>"
      elseif type == "txt" then
        icon = "<i class=\"fa-solid fa-file-lines\"></i>"
      elseif type == "img" then
        icon = "<i class=\"fa-solid fa-file-image\"></i>"
      elseif type == "zip" then
        icon = "<i class=\"fa-solid fa-file-zipper\"></i>"
      elseif type == "slides" then
        icon = "<i class=\"fa-solid fa-file-powerpoint\"></i>"
      else
        icon = "<i class=\"fa-solid fa-file\"></i>"
      end

      local html_output = string.format(
        "<a href=\"%s\">%s %s</a>",
        src, icon, s
      )

      return pandoc.RawBlock("html", html_output)
    end)

    local div_content = {
      pandoc.Header(3, header),
      pandoc.Para({pandoc.Str(authors)}, {class = "authors"}),
      pandoc.Para(sub, {class = "venue"}), -- It seems the class cannot be set
      pandoc.Div(file_info, { class = "files" })
    }

    local div = pandoc.Div(div_content, {class = "paper"})

    return div
  end

  return el

end
