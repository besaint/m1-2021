<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>Задание №2</title>
            </head>
            <body>
                <xsl:for-each select="root/графика">
                    <xsl:variable name="idx" select="position() - 1"/>

                    <canvas 
                        id="canvas-{$idx}" 
                        width="{@ширина}" 
                        height="{@высота}"
                    ></canvas>

                    <script>
                        var canvas = document.getElementById("canvas-<xsl:value-of select="$idx" />");
                        var context = canvas.getContext('2d')

                        <xsl:for-each select="эллипс">
                            draw(
                                context, 
                                <xsl:value-of select="@cx" />, 
                                <xsl:value-of select="@cy" />, 
                                <xsl:value-of select="@rx" />, 
                                <xsl:value-of select="@ry" />, 
                                '<xsl:value-of select="@ободок" />',
                                '<xsl:value-of select="@заливка" />'
                            );
                        </xsl:for-each>



                        function draw(ctx, cx, cy, rx, ry, stroke, fill) {
                            if(ctx.ellipse)
                            {
                                ctx.save();
                                ctx.beginPath();
                                ctx.ellipse(cx, cy, rx, ry, 0, 0, Math.PI*2);
                                ctx.strokeStyle=stroke;
                                ctx.stroke();
                                ctx.fillStyle=fill;
                                ctx.fill();     
                                ctx.restore();
                            }
                        }
                    </script>
                        
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>