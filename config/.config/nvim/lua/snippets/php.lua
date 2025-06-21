local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("php", {
    s("strict", { t("declare(strict_types=1);") }),

    s("inv", {
        t("public function __invoke("), i(1), t("): "), i(2, "void"),
        t({"", "{"}),
        t("    "), i(3),
        t({"", "}"}),
    }),

    s("pubf", {
        t("public function "), i(1), t("("), i(2), t("): "), i(3, "void"),
        t({"", "{"}),
        t("    "), i(0),
        t({"", "}"}),
    }),

    s("prof", {
        t("protected function "), i(1), t("("), i(2), t("): "), i(3, "void"),
        t({"", "{"}),
        t("    "), i(0),
        t({"", "}"}),
    }),

    s("prif", {
        t("private function "), i(1), t("("), i(2), t("): "), i(3, "void"),
        t({"", "{"}),
        t("    "), i(0),
        t({"", "}"}),
    }),

    s("pubsf", {
        t("public static function "), i(1), t("("), i(2), t("): "), i(3, "void"),
        t({"", "{"}),
        t("    "), i(0),
        t({"", "}"}),
    }),

    s("it", {
        t("it('"), i(1), t("', function () {"),
        t({"", "    // Arrange"}),
        t({"", "    "}), i(0),
        t({"", "", "    // Act", "", "    // Assert", "", "});"}),
    }),
})
