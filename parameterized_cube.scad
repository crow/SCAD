// Parameterized cube module with optional rounded edges and hollow interior
module param_cube(
    size = [50, 50, 50],  // [x, y, z] dimensions
    center = true,        // center the cube
    wall_thickness = 2,   // wall thickness for hollow cube (0 for solid)
    corner_radius = 0,    // radius for rounded corners (0 for sharp corners)
    $fn = 32             // resolution for rounded corners
) {
    // Validate inputs
    assert(len(size) == 3, "Size must be a vector of [x, y, z] dimensions");
    assert(wall_thickness >= 0, "Wall thickness must be non-negative");
    assert(corner_radius >= 0, "Corner radius must be non-negative");
    
    // Create solid or hollow cube
    difference() {
        // Outer cube
        if (corner_radius > 0) {
            // Rounded cube using minkowski
            minkowski() {
                cube([
                    size[0] - 2 * corner_radius,
                    size[1] - 2 * corner_radius,
                    size[2] - 2 * corner_radius
                ], center = center);
                sphere(r = corner_radius);
            }
        } else {
            // Regular cube
            cube(size, center = center);
        }
        
        // Interior hollow (if wall_thickness > 0)
        if (wall_thickness > 0) {
            translate([0, 0, 0])
            cube([
                size[0] - 2 * wall_thickness,
                size[1] - 2 * wall_thickness,
                size[2] - 2 * wall_thickness
            ], center = center);
        }
    }
}

// Example usage:
// Basic cube
param_cube([30, 30, 30]);
