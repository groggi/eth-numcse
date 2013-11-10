# Elementary Matrices
* http://science.kennesaw.edu/~plaval/math3260/elemmat.pdf

# Givens rotation
Eine Givens Rotation G(i, j, w) ist eine quadratische Matrix, in deren Diagonale alles `1`en stehen. Es gilt:
* g_{k, k} = 1 für  k != i, k != j
* g_{i, i} = cos(w)
* g_{j, j} = cos(w)
* g_{j, i} = -sin(w)
* g_{i, j} = sin(w) für i > j

G(i, j, w) * x, wobei x ein Vektor ist, so wird hiermit der Vektor x in der Ebene (i, j) um den Winkel (w) im Gegenuhrzeigersinn gedreht.

# Notizen, allgemein
* `u`, `v` Spaltenvektoren, dann ist `u^H * v` ein Skalar