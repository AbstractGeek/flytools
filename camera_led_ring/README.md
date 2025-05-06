# Camera LED Ring

This module provides the design for a 3D-printable camera LED ring. The ring is designed to focus LEDs onto an object plane, making it suitable for applications requiring uniform illumination.

## Key Features

- **Adjustable LED Focus**: The LED angle is computed based on the lens distance and diameter to ensure proper focus onto the object plane.
- **Customizable Parameters**: Key parameters such as lens distance, lens diameter, LED count, and ring dimensions can be modified to suit specific requirements.
- **Compact Design**: The ring is designed with a thickness and width optimized for LED placement and structural integrity.

## Usage

To generate the 3D model, load the `camera_led_ring.scad` file in OpenSCAD and render the design. Modify the parameters at the top of the file to customize the ring for your specific needs.

- Ensure the parameters are adjusted based on the physical dimensions of lens and LEDs.
- The tolerances are set to ensure a snug fit for the LEDs and proper assembly of the ring. Adjust this if required.

### Parameters

#### Key Parameters
- `lens_distance`: Distance of the lens/ring from the object (focus) plane (default: 110 mm).
- `lens_dia`: Diameter of the lens (default: 30 mm).
- `led_count`: Number of LEDs on the ring (default: 4).

#### Ring Parameters
- `ring_thickness`: Thickness of the ring (default: 10 mm).
- `ring_width`: Width of the ring (default: 6 mm).
- `ring_tol`: Tolerance for the ring dimensions (default: 0.5 mm).

#### LED Parameters
- `led_d`: Diameter of the LED (default: 5 mm).
- `led_h`: Height of the LED (default: 6 mm).
- `led_base_d`: Diameter of the LED base (default: 5.8 mm).
- `led_base_h`: Height of the LED base (calculated as `ring_width - led_h`).
- `led_tol`: Tolerance for the LED dimensions (default: 0.15 mm).
- `led_h_tol`: Height tolerance for the LED (default: 0.5 × `ring_width`).

## Files

- `camera_led_ring.scad`: OpenSCAD file containing the 3D model design.
- `camera_led_ring_d30_n4.stl`: Pre-generated STL file for a ring with a 30 mm lens diameter and 4 LEDs.
- `camera_led_ring_d36.5_n8.stl`: Pre-generated STL file for a ring with a 36.5 mm lens diameter and 8 LEDs.

## Modules

### `makeRing()`
Creates the main ring structure with the specified dimensions and tolerances.

### `makeLed(a, v)`
Creates an LED model with the specified angle (`a`) and vector (`v`) for proper alignment on the ring.

## Computed Values

**LED Angle (`ang`)**: The angle at which LEDs are placed is computed using the formula:

$$\theta_{LED} = tan^{-1}(\frac{d_{lens}}{r_{lens}+t_{ring}})$$

This ensures the LEDs are focused onto the object plane.


<!-- 
ToDo:
- add three sets of screws to center the ring on the lens. 
-->