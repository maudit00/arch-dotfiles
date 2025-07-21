local ls = require("luasnip")

-- Define MJML snippets
ls.add_snippets("mjml", {
  -- Main MJML Boilerplate
  ls.parser.parse_snippet(
    "mjmlbri",
    [[
    <mjml>
      <mj-head>
        <mj-title>${1:Your Title}</mj-title>
        <mj-preview>${2:Preview content here}</mj-preview>
        <mj-attributes>
          <mj-all padding="0px" font-family="'Open Sans', sans-serif" />
        </mj-attributes>
        <mj-style>
          @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap');
        </mj-style>
      </mj-head>
      <mj-body background-color="#ffffff" width="600px">
        ${3:Main content goes here}
      </mj-body>
    </mjml>
  ]]
  ),

  -- Header Section
  ls.parser.parse_snippet(
    "mjheaderbri",
    [[
    <mj-section background-color="#ffffff">
      <mj-column>
        <mj-text mj-class="centered" font-size="12px" line-height="26px" align="center" color="#6C6C6C" padding="8px 28px">
          <a href="%%view_email_url%%" target="_blank" style="color:#6C6C6C;text-decoration:none;"><u>Browser view</u></a>
        </mj-text>
      </mj-column>
    </mj-section>
  ]]
  ),

  -- Main Title Section
  ls.parser.parse_snippet(
    "mjtitlebri",
    [[
    <mj-section background-color="#F0EEED">
      <mj-column padding="10px 0px">
        <mj-text font-size="20px" line-height="30px" color="#0F0F0F">
          <b>${1:Preparati all'inverno: scopri le soluzioni per il riscaldamento perfetto!}</b>
        </mj-text>
      </mj-column>
    </mj-section>
  ]]
  ),

  -- Main Image Section
  ls.parser.parse_snippet(
    "mjimagebri",
    [[
    <mj-section>
      <mj-column>
        <mj-image src="${1:https://example.com/image.jpg}" width="600px" href="${2:https://example.com}" />
      </mj-column>
    </mj-section>
  ]]
  ),

  -- Main Text Section
  ls.parser.parse_snippet(
    "mjtextbri",
    [[
    <mj-section background-color="#f0eeed">
      <mj-column width="94%">
        <mj-text mj-class="centered" font-size="16px" line-height="25px">
          ${1:L'inverno è vicino e noi siamo pronti a riscaldare i tuoi spazi...}
        </mj-text>
      </mj-column>
    </mj-section>
  ]]
  ),

  -- Call to Action Button
  ls.parser.parse_snippet(
    "mjbuttonbri",
    [[
    <mj-section background-color="#F0EEED">
      <mj-column>
        <mj-button align="center" background-color="#000000" color="#FFFFFF" href="${1:https://example.com}" padding="30px 0px">
          ${2:Sfoglia il catalogo}
        </mj-button>
      </mj-column>
    </mj-section>
  ]]
  ),

  -- Product Section
  ls.parser.parse_snippet(
    "mjproductbri",
    [[
    <mj-section padding="16px 18px 32px 18px" background-color="#F0EEED">
      <mj-column background-color="#ffffff" width="43%" border="1px solid #F0EEED">
        <mj-image src="${1:https://example.com/product.jpg}" href="${2:https://example.com/product}" />
      </mj-column>
    </mj-section>
  ]]
  ),
})
