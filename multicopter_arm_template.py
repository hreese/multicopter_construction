#!/usr/bin/python

import cairo
from math import pi

class DrillTemplateArm:
    def __init__(self):
        self.len = 1
        self.diameter = 1
        self.holes = []

    def setSize(self,length=240, diameter=10):
        self.len = length
        self.diameter = diameter

    def addHole(self,x_offset=0, y_offset=0, diameter=3):
        self.holes.append({'xoff': x_offset, 'yoff': y_offset, 'diam': diameter})

    def drawArms(self, ctx):
        y_centerline = self.diameter/2.0
        cutmark_offset = 5
        cutmark_length = 10

        # arm (shape)
        ctx.set_source_rgb(.7,.7,.7)
        ctx.rectangle(0, 0, self.len, self.diameter)
        ctx.fill()
        # arm (centerline)
        ctx.new_path()
        ctx.set_source_rgb(1,0,0)
        ctx.set_line_width(linewidth)
        ctx.set_dash([0.5,0.5])
        ctx.move_to(0, y_centerline)
        ctx.line_to(self.len, y_centerline)
        ctx.stroke()
        ctx.set_dash([])
        # cutmarks
        ctx.set_source_rgb(0,0,0)
        ctx.move_to(-cutmark_offset, 0)
        ctx.line_to(-cutmark_offset-cutmark_length, 0)
        ctx.move_to(-cutmark_offset, self.diameter)
        ctx.line_to(-cutmark_offset-cutmark_length, self.diameter)
        ctx.move_to(self.len+cutmark_offset, 0)
        ctx.line_to(self.len+cutmark_offset+cutmark_length, 0)
        ctx.move_to(self.len+cutmark_offset, self.diameter)
        ctx.line_to(self.len+cutmark_offset+cutmark_length, self.diameter)
        ctx.stroke()
        # holes
        for hole in self.holes:
            xoff, yoff, diam = hole['xoff'], hole['yoff'], hole['diam'] 
            if xoff < 0:
                xoff = xoff + self.len
            # ring
            radius = diam/2.0
            ctx.new_path()
            ctx.set_line_width(linewidth)
            ctx.arc(xoff, y_centerline, radius, 0, pi * 2.0)
            ctx.set_source_rgb(0,0,0)
            ctx.stroke_preserve()
            ctx.set_source_rgb(1,1,1)
            ctx.fill()
            ctx.set_source_rgb(0,0,0)
            # X
            ctx.new_path()
            ctx.move_to(xoff-radius, y_centerline+yoff-radius)
            ctx.line_to(xoff+radius, y_centerline+yoff+radius)
            ctx.stroke()
            ctx.move_to(xoff-radius, y_centerline+yoff+radius)
            ctx.line_to(xoff+radius, y_centerline+yoff-radius)
            ctx.stroke()

# width of the surface, in points (1 point == 1/72.0 inch)
# A4
mm_to_points = 72 * 0.039370079
pagewidth, pageheight = 297, 210
linewidth = 0.1

# create the surface and context
surface = cairo.PDFSurface( "quad_bohrschablone.pdf", pagewidth * mm_to_points, pageheight * mm_to_points)
#surface = cairo.SVGSurface( "quad_bohrschablone.svg", pagewidth * mm_to_points, pageheight * mm_to_points)
context = cairo.Context(surface)
context.scale(mm_to_points, mm_to_points)

step_offset = 16
for copy in xrange(0,12):
    # start arm
    context.save()
    context.translate(30,10+copy*step_offset)
    tmpl = DrillTemplateArm()
    tmpl.setSize(240,10)
    # motor
    motor_offset = 35
    tmpl.addHole(motor_offset + 0,0,3)
    tmpl.addHole(motor_offset + 8.5,0,3)
    tmpl.addHole(motor_offset + 16.5,0,8)
    tmpl.addHole(motor_offset + 24.5,0,3)
    tmpl.addHole(motor_offset + 33,0,3)
    # centerplate
    centerplate_offset = -10
    tmpl.addHole(centerplate_offset - 0,0,3)
    tmpl.addHole(centerplate_offset - 10.25,0,3)
    tmpl.addHole(centerplate_offset - 30.00,0,3)

    tmpl.drawArms(context)
    context.restore()

# finalization
context.show_page()
surface.finish()

