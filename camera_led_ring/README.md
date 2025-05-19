# Camera LED Ring

This module provides the design for a 3D-printable camera LED ring. The ring is designed to focus LEDs onto an object plane, making it suitable for applications requiring uniform illumination.

## Key Features

- **Adjustable LED Focus**: The LED angle is computed based on the lens distance and diameter to ensure proper focus onto the object plane.
- **Customizable Parameters**: Key parameters such as lens distance, lens diameter, LED count, and ring dimensions can be modified to suit specific requirements.
- **Compact Design**: The ring is designed with a thickness and width optimized for LED placement and structural integrity.
- **Adjustment Screw Support**: Optionally add screw holes for centering the ring on the lens.

## Usage

To generate the 3D model, load the `camera_led_ring.scad` file in OpenSCAD and render the design. Modify the parameters at the top of the file to customize the ring for your specific needs.

- Ensure the parameters are adjusted based on the physical dimensions of your lens and LEDs.
- Tolerances are set to ensure a snug fit for the LEDs and proper assembly of the ring. Adjust if required.

### Parameters

#### Key Parameters
- `lens_distance`: Distance from the lens/ring to the object (focus) plane.
- `lens_dia`: Diameter of the lens.
- `led_count`: Number of LEDs on the ring (default: 4).

#### Ring Parameters
- `ring_thickness`: Thickness of the ring (default: 10 mm).
- `ring_height`: Height of the ring (default: 6 mm).

#### LED Parameters
- `led_d`: Diameter of the LED (default: 5 mm).
- `led_h`: Height of the LED (default: 8 mm).
- `led_base_d`: Diameter of the LED base (default: 5.8 mm).
- `led_base_h`: Height of the LED base (default: 2 mm).

#### Adjustment Screw Parameters
- `s_dia`: Diameter of the adjustment screw holes (default: 3.3 mm, suitable for M4 or 8-32 screws).
- `s_count`: Number of screw holes (default: 0, auto-selects 3 or 4 based on LED count).

#### Other Parameters
- `tol`: General tolerance for fit (default: 0.15 mm).
- `led_line`: Position of LED center between inner and outer ring diameter (0 = inner, 1 = outer, 0.6 = default).

### Computed Values

- `ring_dia`: Outer diameter of the ring.
- `led_r`: Radial position of the LEDs.
- `ang`: LED angle, computed as: $\theta_{LED} = tan^{-1}(\frac{d_{lens}}{r_{lens}+t_{ring}})$

This ensures the LEDs are focused onto the object plane.

## Files

- `camera_led_ring.scad`: OpenSCAD file containing the 3D model design.
- `camera_led_ring_d30_n4.stl`: Pre-generated STL file for a ring with a 30 mm lens diameter and 4 LEDs.
- `camera_led_ring_d36.5_n8.stl`: Pre-generated STL file for a ring with a 36.5 mm lens diameter and 8 LEDs.

## Notes

- The design automatically places LEDs evenly around the ring and angles them to focus on the object plane.
- Optional screw holes can be added for precise centering on the lens.
- Adjust parameters as needed for your specific hardware.
