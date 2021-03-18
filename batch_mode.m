%% define directory
originalDir = 'C:/Users/haod776/OneDrive - PNNL/Documents/work/E3SM/script_for_clm_sparse_grid/clm-netcdf/';
cfg.clm_gridded_domain_filename = [originalDir 'domain.lnd.r05_gx1v6.191014.nc'];
cfg.clm_gridded_surfdata_filename = [originalDir 'surfdata_0.5x0.5_simyr2010_c191025.nc'];

topDir = 'C:/Users/haod776/OneDrive - PNNL/Documents/work/proposal_&_code/UCLA_3D_Topo_Data/UCLA_3D_Topo_Data/';
cfg.clm_gridded_topodata_filename = [topDir 'topo_3d_0.5x0.5.nc'];

cfg.out_netcdf_dir = "../1km_data";

cfg.set_natural_veg_frac_to_one = 0;
%% define parameter

cfg.res_h = 1/100;
cfg.res_v = 1/100;

lat_tops = [39 39 38.5 38.5];
lat_bottoms = [38.5 38.5 38 38];
lon_lefts = [-120.5 -120 -120.5 -120];
lon_rights = [-120 -119.5 -120 -119.5];

for i = 1:4
    cfg.lat_top = lat_tops(i);
    cfg.lat_bottom = lat_bottoms(i);
    cfg.lon_left = lon_lefts(i);
    cfg.lon_right = lon_rights(i);

    cfg.clm_usrdat_name = ['grid' num2str(i)  '_1km'];
    
    ELMSparseGridDriver(cfg)
end