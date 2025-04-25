include <fly_tray_modules.scad>

// My custom trays

//// Base tray for stocks
//t1 = tray_size(tray_dims(tr_h, v_dia, 10, 1));
//t2 = tray_size(tray_dims(tr_h, v_dia, 10, 2));
//t3 = tray_size(tray_dims(tr_h, v_dia, 10, 1));
//a = [t1[0],t1[1]+t2[1]+t3[1],bs_h] + [0.2, 0.2, 0];
//echo(a)
//base_tray(a, bs_th, m_th, m_d/2);    

//// Base tray for crosses
//t1 = tray_size(tray_dims(tr_h, v_dia, 5, 2));
//t2 = tray_size(tray_dims(tr_h, v_dia, 5, 6));
//a = [t1[0],t1[1]+t2[1],bs_h] + [0.2, 0.2, 0];
//echo(a)
//base_tray(a, bs_th, m_th, m_d/2);

//// Base tray for emergence vial trays
//t1 = tray_size(tray_dims(tr_h, v_dia, 6, 3));
//t2 = tray_size(tray_dims(tr_h, v_dia, 6, 3));
//t3 = tray_size(tray_dims(tr_h, v_dia, 6, 3));
//t4 = tray_size(tray_dims(tr_h, v_dia, 6, 3));
//a = [t1[0]+t2[0],t3[1]+t4[1],bs_h] + [0.2, 0.2, 0];
//echo(t1);
//echo(a);
//base_tray(a, bs_th, m_th, m_d/2); 

//// Emergence bottle tray (no need of a base tray)
//t1 = tray_dims(tr_h, b_a, 4, 3);     // Bottle tray
//t1_s = tray_size(t1);
//echo(t1_s);
//t2 = tray_dims(tr_h, v_dia, 1, 6);   // Vial tray
//t2_s = tray_size(t2);
//echo(t2_s);
//
//union(){
//    union(){
//        bottle_tray(t1, b_a, b_t_a, v_red=0.55);
//        base_tray(t1, sd_th, m_th, m_d=7.5);    
//    }
//    
//    translate([t1_s[0]/2+t2_s[0]/2,0,0]){
//        union(){
//            vial_tray(t2, v_dia, v_red=0.55);
//            base_tray(t2, sd_th, m_th, m_d=7.5);    
//        }
//    }
//    
//    translate([-t1_s[0]/2-t2_s[0]/2,0,0]){
//        union(){
//            vial_tray(t2, v_dia, v_red=0.55);
//            base_tray(t2, sd_th, m_th, m_d=7.5);    
//        }
//    }
//
//}

// Vial tray for emergence bottle
t1 = tray_size(tray_dims(tr_h-m_th, v_dia, 2, 2), 2);
echo(t1);
// Generate vial tray
a = tray_dims(tr_h-m_th, v_dia, 2, 2);

union(){
    vial_tray(a, v_dia, v_red=0.55);
    base_tray(a, 2, m_th, 1*m_d);    
}
