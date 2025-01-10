puzzles:add{
  id = 'grilles_cube_i',
  name = 'Grilles Cube I',
  version = '1.0.0',
  ndim = 3,
  colors = 'cube',
  build = function (self)
    local sym = cd'bc3'
  
    self:carve(sym:orbit(sym.oox.unit))

    self.axes:add(sym:orbit(sym.oox.unit),{1,0.557,-0.557,-1})

    for _, ax, tw in sym:orbit(self.axes[1], rot{from ='x', to = 'y'}) do
      self.twists:add(ax,tw)
    end

    self.axes:add(sym:orbit(sym.xoo.unit),{ 0.8981,1.732})

    for _, ax, tw in sym.chiral:orbit(self.axes[sym.xoo.unit], sym:thru(3, 2)) do
      self.twists:add(ax, tw)
    end
  end,

  tags = {
    builtin = '2.0.0',
    external = { pCubes = 'cercare', '!hof', '!mc4d', museum = 11033, '!wca' },

    author = { "Emanuele Battistin" },
    inventor = "Mr. Fork",

    'type/puzzle',
    'shape/3d/platonic/cube',
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