$(document).ready(function() {

  // Abort if jQuery is broken (happens when annotorious library is loaded on photos page)
  if ($("#render-relations-toggle") == null) {
    return;
  }

  $("#render-relations-toggle").click(function(){
    if ($("#render-relations-toggle").attr("done") == "true") {
      return;
    }
    $("#render-relations").show();
    var panel = $("#viz-container");//.html();

      //panel.find("defs").prepend('<style type="text/css"><![CDATA[ path.link { marker-end: none; fill: none; stroke: #999; stroke-width: 2px; } ]]></style>');
    var pos = $("<div class='alert alert-info'>").text("Generowanie...");
    $("#render-relations").append(pos);
      var svg = $("#viz-container svg");
    $.post("/svg_renders",
      {svg: remapHrefs(svg[0].outerHTML, '{root}/public')},
      function(data){
        var content;
        if(data['url']){
          content = "<a href='" + data.url + "'>" + data.url + "</a>";
        }else{
          if(data['errors']){
            content = data.errors;
          }else{
            content = "Wystąpił błąd podczas generowania obrazu jpg";
          }
        }
        pos.html(content);
        $("#render-relations-toggle").attr("done", "true");
      },
      'json');
  });
});

function remapHrefs(svgEl, pathPrefix){
    var el = $(svgEl).clone();
    $(el).find('image').each(function(){
        var _oldPath = $(this)[0].getAttributeNS('http://www.w3.org/1999/xlink', 'href');
        $(this)[0].setAttributeNS('http://www.w3.org/1999/xlink', 'xlink:href', pathPrefix + _oldPath);
    });
    console.log(el[0].outerHTML);
    return el[0].outerHTML;
}