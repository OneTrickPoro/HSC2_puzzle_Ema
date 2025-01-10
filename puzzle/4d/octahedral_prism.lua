puzzles:add({
    id = 'octahedral_prism',
    version = '0.1.0',
    name = 'Octahedral prism',
    ndim = 4,
    tags = { 'experimental' },
    build = function(p)
      local sym = cd{4,3,2}
      local pr = sym.ooox.unit
      local fo = sym.xooo.unit
      p:carve(sym:orbit(pr))
      p:carve(sym:orbit(fo))

      p.axes:add(sym:orbit(pr), {1, 0.5, 0, -0.5, -1})
      p.axes:add(sym:orbit(fo), {1, 0.33, -0.33, -1})
      
      -- rotate around octa vertex
      for _, axis, twist_transform in sym.chiral:orbit(p.axes[pr], sym:thru(2, 1)) do
        p.twists:add(axis, twist_transform, {gizmo_pole_distance = 1})
      end
      -- rotate octa prism around ax of prism
      for _, axis, twist_transform in sym.chiral:orbit(p.axes[pr], sym:thru(3,2)) do
        p.twists:add(axis, twist_transform, {gizmo_pole_distance = 1})
      end
      -- rotate around octa vertex
      for _, axis, twist_transform in sym.chiral:orbit(p.axes[fo], sym:thru(3, 2)) do
        p.twists:add(axis, twist_transform, {gizmo_pole_distance = 0.5})
      end
      -- flip prism
      for _, axis, twist_transform in sym.chiral:orbit(p.axes[fo], sym:thru(4,3)) do
        p.twists:add(axis, twist_transform, {gizmo_pole_distance = 0.5})
      end
    end,
  })
