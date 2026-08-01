(function () {
  function renderMermaidBlocks() {
    if (!window.mermaid) {
      return;
    }

    var blocks = document.querySelectorAll("pre.mermaid > code, pre > code.language-mermaid, pre > code.mermaid");

    blocks.forEach(function (code) {
      var pre = code.parentElement;
      var diagram = document.createElement("div");

      diagram.className = "mermaid";
      diagram.textContent = code.textContent;
      pre.replaceWith(diagram);
    });

    window.mermaid.initialize({
      startOnLoad: false,
      securityLevel: "loose",
      theme: window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "default"
    });

    window.mermaid.run({ querySelector: ".mermaid" });
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", renderMermaidBlocks);
  } else {
    renderMermaidBlocks();
  }
}());
