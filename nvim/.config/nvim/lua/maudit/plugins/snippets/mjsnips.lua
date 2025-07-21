local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt

-- -- NOTE: BRICO
-- -- Main MJML Boilerplate
-- ls.parser.parse_snippet(
--   "mjmlbrico",
--   [[
--       <mjml>
--         <mj-head>
--           <mj-title>${1:Scopri le stufe migliori per un inverno senza pensieri}</mj-title>
--           <mj-preview>${2:Sfoglia il catalogo e trova la soluzione ideale per il freddo!}</mj-preview>
--           <mj-attributes>
--             <mj-all padding="0px" font-family="'Open Sans', sans-serif" />
--             <mj-text font-family="'Open Sans', Arial, sans-serif" />
--           </mj-attributes>
--           <mj-style inline="inline">
--             .center { text-align:center!important; }
--           </mj-style>
--           <mj-style>
--             @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&family=Quattrocento:wght@400;700&display=swap');
--           </mj-style>
--         </mj-head>
--         <mj-body background-color="#ffffff" width="600px">
--           ${3:Main Content}
--         </mj-body>
--       </mjml>
--     ]]
-- )
--
-- -- Header Section
-- ls.parser.parse_snippet(
--   "mjhebri",
--   [[
--       <mj-section background-color="#ffffff">
--         <mj-column>
--           <mj-text font-size="12px" line-height="26px" align="center" color="#6C6C6C" padding="8px 28px">
--             <a href="%%view_email_url%%" target="_blank" style="color:#6C6C6C;text-decoration:none;"><u>Browser view</u></a>
--           </mj-text>
--         </mj-column>
--       </mj-section>
--     ]]
-- )
--
-- -- Main Title Section
-- ls.parser.parse_snippet(
--   "mjtibri",
--   [[
--       <mj-section background-color="#F0EEED">
--         <mj-column padding="10px 0px">
--           <mj-text mj-class="centered" font-size="20px" line-height="30px" color="#0F0F0F">
--             <b>${1:Preparati all'inverno: scopri le soluzioni per il riscaldamento perfetto!}</b>
--           </mj-text>
--         </mj-column>
--       </mj-section>
--     ]]
-- )
--
-- -- Main Image Section
-- ls.parser.parse_snippet(
--   "mjimbri",
--   [[
--       <mj-section>
--         <mj-column>
--           <mj-image src="${1:img/hero.png}" width="600px" href="${2:https://example.com}" />
--         </mj-column>
--       </mj-section>
--     ]]
-- )
--
-- -- Main Text Section
-- ls.parser.parse_snippet(
--   "mjtebri",
--   [[
--       <mj-section background-color="#f0eeed">
--         <mj-column width="94%">
--           <mj-text mj-class="centered" font-size="16px" line-height="25px">
--             ${1:L'inverno è vicino e noi siamo pronti a <b>riscaldare i tuoi spazi</b> con soluzioni pratiche, economiche e adatte a ogni esigenza. Sfoglia il nostro <b>catalogo riscaldamento 100% digitale</b> e trova il prodotto giusto per te.}
--           </mj-text>
--         </mj-column>
--       </mj-section>
--     ]]
-- )
--
-- -- Call to Action Button
-- ls.parser.parse_snippet(
--   "mjbubri",
--   [[
--       <mj-section background-color="#F0EEED">
--         <mj-column>
--           <mj-button align="center" background-color="#000000" color="#FFFFFF" href="${1:https://example.com}" padding="30px 0px">
--             ${2:Sfoglia il catalogo}
--           </mj-button>
--         </mj-column>
--       </mj-section>
--     ]]
-- )
--
-- -- Product Section
-- ls.parser.parse_snippet(
--   "mjprobri",
--   [[
--       <mj-section padding="16px 18px 32px 18px" background-color="#F0EEED">
--         <mj-column background-color="#ffffff" width="43%" css-class="border-radius-10" border="1px solid #F0EEED">
--           <mj-image src="${1:img/prod1.png}" href="${2:https://example.com}" />
--         </mj-column>
--       </mj-section>
--     ]]
-- )

-- Add additional snippets as needed

ls.parser.parse_snippet(
  "mj-image",
  [[
      <mj-image src="${1:https://example.com/image.jpg}" href="${3:ImageLink}" alt="${2:Image Description}" />
    ]]
)

ls.add_snippets("mjml", {
  s(
    "mjml",
    fmt(
      [[
    <mjml>
      <mj-head>
        {head}
      </mj-head>
      <mj-body>
        {body}
      </mj-body>
    </mjml>
  ]],
      {
        head = i(1, "<!-- Add head content here -->"),
        body = i(2, "<!-- Add body content here -->"),
      }
    )
  ),

  -- Standard Head Components
  s(
    "mjattributes",
    fmt(
      [[
    <mj-attributes>
      {attributes}
    </mj-attributes>
  ]],
      { attributes = i(1, "/* Add attributes here */") }
    )
  ),
  s(
    "mjbreakpoint",
    fmt(
      [[
    <mj-breakpoint width="{width}" />
  ]],
      { width = i(1, "600px") }
    )
  ),
  s(
    "mjfont",
    fmt(
      [[
    <mj-font name="{name}" href="{href}" />
  ]],
      { name = i(1, "FontName"), href = i(2, "https://font-url.com") }
    )
  ),
  s(
    "mjhtmlattributes",
    fmt(
      [[
    <mj-html-attributes>
      {attributes}
    </mj-html-attributes>
  ]],
      { attributes = i(1, "/* Add HTML attributes here */") }
    )
  ),
  s(
    "mjpreview",
    fmt(
      [[
    <mj-preview>
      {text}
    </mj-preview>
  ]],
      { text = i(1, "Preview text here") }
    )
  ),
  s(
    "mjstyle",
    fmt(
      [[
    <mj-style>
      {styles}
    </mj-style>
  ]],
      { styles = i(1, "/* Add styles here */") }
    )
  ),
  s(
    "mjtitle",
    fmt(
      [[
    <mj-title>
      {title}
    </mj-title>
  ]],
      { title = i(1, "Title here") }
    )
  ),

  -- Standard Body Components
  s(
    "mjaccordion",
    fmt(
      [[
    <mj-accordion>
      {content}
    </mj-accordion>
  ]],
      { content = i(1, "<!-- Add accordion content here -->") }
    )
  ),
  s(
    "mjbutton",
    fmt(
      [[
    <mj-button>
      {text}
    </mj-button>
  ]],
      { text = i(1, "<!-- Add button text here -->") }
    )
  ),
  s(
    "mjcarousel",
    fmt(
      [[
    <mj-carousel>
      {content}
    </mj-carousel>
  ]],
      { content = i(1, "<!-- Add carousel content here -->") }
    )
  ),
  s(
    "mjcolumn",
    fmt(
      [[
    <mj-column width="{width}">
      {content}
    </mj-column>
  ]],
      { width = i(1, "600px"), content = i(2, "<!-- Add column content here -->") }
    )
  ),
  s(
    "mjdivider",
    fmt(
      [[
    <mj-divider {attributes} />
  ]],
      { attributes = i(1, "/* Add divider attributes here */") }
    )
  ),
  s(
    "mjgroup",
    fmt(
      [[
    <mj-group>
      {content}
    </mj-group>
  ]],
      { content = i(1, "<!-- Add group content here -->") }
    )
  ),
  s(
    "mjhero",
    fmt(
      [[
    <mj-hero>
      {content}
    </mj-hero>
  ]],
      { content = i(1, "<!-- Add hero content here -->") }
    )
  ),
  s(
    "mjimage",
    fmt(
      [[
    <mj-image src="{src}" alt="{alt}" />
  ]],
      { src = i(1, "https://image-url.com"), alt = i(2, "Image description") }
    )
  ),
  s(
    "mjnavbar",
    fmt(
      [[
    <mj-navbar>
      {content}
    </mj-navbar>
  ]],
      { content = i(1, "<!-- Add navbar content here -->") }
    )
  ),
  s(
    "mjraw",
    fmt(
      [[
    <mj-raw>
      {content}
    </mj-raw>
  ]],
      { content = i(1, "<!-- Add raw HTML here -->") }
    )
  ),
  s(
    "mjsection",
    fmt(
      [[
    <mj-section>
      {content}
    </mj-section>
  ]],
      { content = i(1, "<!-- Add section content here -->") }
    )
  ),
  s(
    "mjsocial",
    fmt(
      [[
    <mj-social>
      {content}
    </mj-social>
  ]],
      { content = i(1, "<!-- Add social content here -->") }
    )
  ),
  s(
    "mjspacer",
    fmt(
      [[
    <mj-spacer height="{height}" />
  ]],
      { height = i(1, "20px") }
    )
  ),
  s(
    "mjtable",
    fmt(
      [[
    <mj-table>
      {content}
    </mj-table>
  ]],
      { content = i(1, "<!-- Add table content here -->") }
    )
  ),
  s(
    "mjtext",
    fmt(
      [[
    <mj-text>
      {content}
    </mj-text>
  ]],
      { content = i(1, "<!-- Add text content here -->") }
    )
  ),
  s(
    "mjwrapper",
    fmt(
      [[
    <mj-wrapper>
      {content}
    </mj-wrapper>
  ]],
      { content = i(1, "<!-- Add wrapper content here -->") }
    )
  ),

  -- Ending tags (demonstration of placeholders in ending tags)
  s(
    "mjtextend",
    fmt(
      [[
    <mj-text>
      {content}
    </mj-text>
  ]],
      { content = i(1, "<!-- Add text content here -->") }
    )
  ),
  s(
    "mjbuttonend",
    fmt(
      [[
    <mj-button>
      {text}
    </mj-button>
  ]],
      { text = i(1, "<!-- Add button text here -->") }
    )
  ),
  s("mjsc", {
    t({ "<mj-section>", "<mj-column>", "</mj-column>", "</mj-section>" }),
  }),
  s("mjg", {
    t({
      "<mj-raw>",
      "<!-- inizio gallery -->",
      "</mj-raw>",
      "<mj-section>",
      "<mj-group css-class='center'>",
      "<mj-column padding='0px 0px 0px 0px' width='6%'>",
      "<mj-spacer height='0%'></mj-spacer>",
      "</mj-column>",
      "<mj-column padding='0px 0px 0px 0px' width='52.33%'>",
      "<mj-image src='' href='https://' padding='0px 5px 0px 0px' fluid-on-mobile='true' css-class='gallery-img-1-padding'></mj-image>",
      "</mj-column>",
      "<mj-column padding='0px 0px 0px 0px' width='34%'>",
      "<mj-image src='' href='https://' padding='0px 0px 5px 5px' fluid-on-mobile='true' css-class='gallery-img-2-padding'></mj-image>",
      "<mj-image src='' href='https://' padding='5px 0px 0px 5px' fluid-on-mobile='true' css-class='gallery-img-3-padding'></mj-image>",
      "</mj-column>",
      "<mj-column padding='0px 0px 0px 0px' width='6%'>",
      "<mj-spacer height='0%'></mj-spacer>",
      "</mj-column>",
      "</mj-group>",
      "</mj-section>",
      "<mj-raw>",
      "<!-- fine gallery -->",
      "</mj-raw>",
    }),
  }),
  s("mjproduct", {
    t({
      '<mj-section padding="0px 0px" background-color="#ffffff">',
      '\t<mj-column padding="10px 0px" vertical-align="middle">',
    }),
    t({ '\t\t<mj-image padding="0px" href="' }),
    i(1, "https://link.to.product"),
    t({ '" src="' }),
    i(2, "img/pdt01.png"),
    t({ '"></mj-image>', "\t</mj-column>" }),
    t({ '\t<mj-column padding="10px 0px" vertical-align="middle">' }),
    t({
      '\t\t<mj-text css-class="font-change2" color="#000000" font-weight="400" line-height="20px" padding="0px 20px 10px">',
      '\t\t\t<span style="font-size:22px;mso-line-height-rule:exactly;line-height:38px;" class="font-change2">',
    }),
    i(3, "Your product description goes here."),
    t({ "</span>", "\t\t</mj-text>", "\t</mj-column>", "</mj-section>", "" }),

    t({
      '<mj-section direction="rtl" padding="0px 0px" background-color="#ffffff">',
      '\t<mj-column padding="10px 0px" vertical-align="middle">',
    }),
    t({ '\t\t<mj-image padding="0px" href="' }),
    i(4, "https://link.to.product"),
    t({ '" src="' }),
    i(5, "img/pdt02.png"),
    t({ '"></mj-image>', "\t</mj-column>" }),
    t({ '\t<mj-column padding="10px 0px" vertical-align="middle">' }),
    t({
      '\t\t<mj-text css-class="font-change2" color="#000000" font-weight="400" line-height="20px" padding="0px 20px 10px">',
      '\t\t\t<span style="font-size:22px;mso-line-height-rule:exactly;line-height:30px;" class="font-change2">',
    }),
    i(6, "Your second product description goes here."),
    t({ "</span>", "\t\t</mj-text>", "\t</mj-column>", "</mj-section>" }),
  }),
})
