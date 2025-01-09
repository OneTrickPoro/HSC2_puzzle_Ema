puzzles:add{
    id = 'tuttminx_wannabe',
    name = 'tuttminx_wannabe',
    version = '1.0.0',
    ndim = 3,
    colors = "dodecahedron",
    build = function (self)
      local sym = cd'h3'
      local shape = lib.symmetries.dodecahedral.dodecahedron()
      local tr1 = sym.xoo.unit
      local tr2 = sym.oox.unit

      self:carve(sym:orbit(tr1/1.5))
      self:carve(sym:orbit(tr2/1.5))



      self.axes:add(sym:orbit(sym.oox.unit),{1,0.62,-0.62,-1})

      for _, ax, tw in sym.chiral:orbit(self.axes[sym.oox.unit], sym:thru(2,1)) do
        self.twists:add(ax, tw, { gizmo_pole_distance = .7 })
      end

      self.axes:add(sym:orbit(sym.xoo.unit),{1,0.6,-0.6,-1})

      for _, ax, tw in sym.chiral:orbit(self.axes[sym.xoo.unit], sym:thru(3,2)) do
        self.twists:add(ax, tw, { gizmo_pole_distance = .7 })
      end
    end,

    tags = {
      builtin = '2.0.0',
      external = { '!hof', '!mc4d', museum =__, '!wca' },
  
      author = { "Emanuele Battistin" },
  
      'type/puzzle',
      'shape/3d/platonic/dodecahedron',
      algebraic = {
        'doctrinaire', 'pseudo/doctrinaire',
        '!abelian', '!fused', '!orientations/non_abelian', '!trivial', '!weird_orbits',
      },
      axes = { '3d/elementary/cube', '!hybrid', '!multicore' },
      colors = { '!multi_per_facet', '!multi_facet_per' },
      completeness = { '!super', '!real', '!laminated', '!complex' },
      cuts = { 'depth/deep/to_adjacent', '!stored', '!wedge' },
      turns_by = { 'face', 'vertex' },
      'experimental',
      '!canonical',
      '!family',
      '!variant',
      '!meme',
      '!shapeshifting',
    },
  }