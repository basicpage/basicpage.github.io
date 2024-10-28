function jsondata(data)

  local newdata = {}

  newdata.title = data.title or {}
  newdata.url = data.url or ""
  newdata.authors = data.authors or {}
  newdata.venue = data.venue
  newdata.year = data.year
  newdata.files = data.files or pandoc.List()

  return newdata

end

function yamldata(data)

  local newdata = {}

  newdata.title = data["title"] or {}
  newdata.url = data["url"] or ""
  newdata.authors = data["authors"] or {}
  -- A bit ridiculous to do this to get strings
  newdata.venue = pandoc.write(pandoc.Pandoc{data["venue"]}, 'html')
  newdata.year = pandoc.write(pandoc.Pandoc{data["year"]}, 'html')
  local files = data["files"] or pandoc.List()

  newdata.files = files:map(function(data)
    local newfile = {}

    newfile.text = pandoc.write(pandoc.Pandoc{data.text}, 'html')
    newfile.type = pandoc.write(pandoc.Pandoc{data.type}, 'html')
    newfile.src = pandoc.write(pandoc.Pandoc{data.src}, 'html')

    return newfile
  end)

  return newdata

end

function paper(data)

  local title = data.title
  local url = data.url
  local authors = data.authors
  local venue = data.venue
  local year = data.year
  local files = data.files

  local header = {}

  if url then
    header = { pandoc.Link(title, url) }
  else
    header = { title }
  end

  local sub = {}

  if venue and year then
    sub = { pandoc.Str(string.format("%s (%s)", venue, year)) }
  elseif venue then
    sub = { venue }
  elseif year then
    sub = { year }
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
    pandoc.Div(authors, {class = "authors"}),
    pandoc.Para(sub),
    pandoc.Div(file_info, {class = "files"})
  }

  local div = pandoc.Div(div_content, {class = "paper"})

  return div

end

function CodeBlock(el)

  if el.classes[1] == "paper" and el.classes[2] == "yaml" then
    local content = string.format("---\n%s\n---", el.text)

    local doc = pandoc.read(content)

    if not doc then
      error("Failed to decode yaml:\n" .. content)
    end

    return paper(yamldata(doc.meta))
  end

  if el.classes[1] == "paper" then
    local content = string.format("{ %s }", el.text)

    local data = pandoc.json.decode(content, false)

    if not data then
      error("Failed to decode JSON:\n" .. content)
    end

    return paper(jsondata(data))
  end

  if el.classes[1] == "papers" then
    local content = string.format("[ %s ]", el.text)

    local data = pandoc.json.decode(content, false)

    if not data then
      error("Failed to decode JSON:\n" .. content)
    end

    local content = data:map(function(d)
      return paper(jsondata(d))
    end)

    return pandoc.Blocks(content)
  end

end
