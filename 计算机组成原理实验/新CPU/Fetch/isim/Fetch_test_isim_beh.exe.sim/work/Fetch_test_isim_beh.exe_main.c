/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000002767688469_1733832700_init();
    work_m_00000000004042805075_1817558700_init();
    work_m_00000000000058003737_1277932046_init();
    work_m_00000000001363849844_2528794150_init();
    work_m_00000000002265036922_0267516215_init();
    work_m_00000000002597047538_1307194410_init();
    work_m_00000000004165789425_2817105642_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000004165789425_2817105642");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
