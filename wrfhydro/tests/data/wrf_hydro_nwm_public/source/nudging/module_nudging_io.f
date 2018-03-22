












!  Program Name:
!  Author(s)/Contact(s):
!  Abstract:
!  History Log:
! 
!  Usage:
!  Parameters: <Specify typical arguments passed>
!  Input Files:
!        <list file names and briefly describe the data they include>
!  Output Files:
!        <list file names and briefly describe the information they include>
! 
!  Condition codes:
!        <list exit condition or error codes returned >
!        If appropriate, descriptive troubleshooting instructions or
!        likely causes for failures could be mentioned here with the
!        appropriate error code
! 
!  User controllable options: <if applicable>

module module_nudging_io

use netcdf
use module_namelist, only: nlst_rt
use module_RT_data,  only: rt_domain

implicit none
!     NetCDF-3.
!
! netcdf version 3 fortran interface:
!

!
! external netcdf data types:
!
      integer nf_byte
      integer nf_int1
      integer nf_char
      integer nf_short
      integer nf_int2
      integer nf_int
      integer nf_float
      integer nf_real
      integer nf_double

      parameter (nf_byte = 1)
      parameter (nf_int1 = nf_byte)
      parameter (nf_char = 2)
      parameter (nf_short = 3)
      parameter (nf_int2 = nf_short)
      parameter (nf_int = 4)
      parameter (nf_float = 5)
      parameter (nf_real = nf_float)
      parameter (nf_double = 6)

!
! default fill values:
!
      integer           nf_fill_byte
      integer           nf_fill_int1
      integer           nf_fill_char
      integer           nf_fill_short
      integer           nf_fill_int2
      integer           nf_fill_int
      real              nf_fill_float
      real              nf_fill_real
      doubleprecision   nf_fill_double

      parameter (nf_fill_byte = -127)
      parameter (nf_fill_int1 = nf_fill_byte)
      parameter (nf_fill_char = 0)
      parameter (nf_fill_short = -32767)
      parameter (nf_fill_int2 = nf_fill_short)
      parameter (nf_fill_int = -2147483647)
      parameter (nf_fill_float = 9.9692099683868690e+36)
      parameter (nf_fill_real = nf_fill_float)
      parameter (nf_fill_double = 9.9692099683868690d+36)

!
! mode flags for opening and creating a netcdf dataset:
!
      integer nf_nowrite
      integer nf_write
      integer nf_clobber
      integer nf_noclobber
      integer nf_fill
      integer nf_nofill
      integer nf_lock
      integer nf_share
      integer nf_64bit_offset
      integer nf_sizehint_default
      integer nf_align_chunk
      integer nf_format_classic
      integer nf_format_64bit
      integer nf_diskless
      integer nf_mmap

      parameter (nf_nowrite = 0)
      parameter (nf_write = 1)
      parameter (nf_clobber = 0)
      parameter (nf_noclobber = 4)
      parameter (nf_fill = 0)
      parameter (nf_nofill = 256)
      parameter (nf_lock = 1024)
      parameter (nf_share = 2048)
      parameter (nf_64bit_offset = 512)
      parameter (nf_sizehint_default = 0)
      parameter (nf_align_chunk = -1)
      parameter (nf_format_classic = 1)
      parameter (nf_format_64bit = 2)
      parameter (nf_diskless = 8)
      parameter (nf_mmap = 16)

!
! size argument for defining an unlimited dimension:
!
      integer nf_unlimited
      parameter (nf_unlimited = 0)

!
! global attribute id:
!
      integer nf_global
      parameter (nf_global = 0)

!
! implementation limits:
!
      integer nf_max_dims
      integer nf_max_attrs
      integer nf_max_vars
      integer nf_max_name
      integer nf_max_var_dims

      parameter (nf_max_dims = 1024)
      parameter (nf_max_attrs = 8192)
      parameter (nf_max_vars = 8192)
      parameter (nf_max_name = 256)
      parameter (nf_max_var_dims = nf_max_dims)

!
! error codes:
!
      integer nf_noerr
      integer nf_ebadid
      integer nf_eexist
      integer nf_einval
      integer nf_eperm
      integer nf_enotindefine
      integer nf_eindefine
      integer nf_einvalcoords
      integer nf_emaxdims
      integer nf_enameinuse
      integer nf_enotatt
      integer nf_emaxatts
      integer nf_ebadtype
      integer nf_ebaddim
      integer nf_eunlimpos
      integer nf_emaxvars
      integer nf_enotvar
      integer nf_eglobal
      integer nf_enotnc
      integer nf_ests
      integer nf_emaxname
      integer nf_eunlimit
      integer nf_enorecvars
      integer nf_echar
      integer nf_eedge
      integer nf_estride
      integer nf_ebadname
      integer nf_erange
      integer nf_enomem
      integer nf_evarsize
      integer nf_edimsize
      integer nf_etrunc

      parameter (nf_noerr = 0)
      parameter (nf_ebadid = -33)
      parameter (nf_eexist = -35)
      parameter (nf_einval = -36)
      parameter (nf_eperm = -37)
      parameter (nf_enotindefine = -38)
      parameter (nf_eindefine = -39)
      parameter (nf_einvalcoords = -40)
      parameter (nf_emaxdims = -41)
      parameter (nf_enameinuse = -42)
      parameter (nf_enotatt = -43)
      parameter (nf_emaxatts = -44)
      parameter (nf_ebadtype = -45)
      parameter (nf_ebaddim = -46)
      parameter (nf_eunlimpos = -47)
      parameter (nf_emaxvars = -48)
      parameter (nf_enotvar = -49)
      parameter (nf_eglobal = -50)
      parameter (nf_enotnc = -51)
      parameter (nf_ests = -52)
      parameter (nf_emaxname = -53)
      parameter (nf_eunlimit = -54)
      parameter (nf_enorecvars = -55)
      parameter (nf_echar = -56)
      parameter (nf_eedge = -57)
      parameter (nf_estride = -58)
      parameter (nf_ebadname = -59)
      parameter (nf_erange = -60)
      parameter (nf_enomem = -61)
      parameter (nf_evarsize = -62)
      parameter (nf_edimsize = -63)
      parameter (nf_etrunc = -64)
!
! error handling modes:
!
      integer  nf_fatal
      integer nf_verbose

      parameter (nf_fatal = 1)
      parameter (nf_verbose = 2)

!
! miscellaneous routines:
!
      character*80   nf_inq_libvers
      external       nf_inq_libvers

      character*80   nf_strerror
!                         (integer             ncerr)
      external       nf_strerror

      logical        nf_issyserr
!                         (integer             ncerr)
      external       nf_issyserr

!
! control routines:
!
      integer         nf_inq_base_pe
!                         (integer             ncid,
!                          integer             pe)
      external        nf_inq_base_pe

      integer         nf_set_base_pe
!                         (integer             ncid,
!                          integer             pe)
      external        nf_set_base_pe

      integer         nf_create
!                         (character*(*)       path,
!                          integer             cmode,
!                          integer             ncid)
      external        nf_create

      integer         nf__create
!                         (character*(*)       path,
!                          integer             cmode,
!                          integer             initialsz,
!                          integer             chunksizehint,
!                          integer             ncid)
      external        nf__create

      integer         nf__create_mp
!                         (character*(*)       path,
!                          integer             cmode,
!                          integer             initialsz,
!                          integer             basepe,
!                          integer             chunksizehint,
!                          integer             ncid)
      external        nf__create_mp

      integer         nf_open
!                         (character*(*)       path,
!                          integer             mode,
!                          integer             ncid)
      external        nf_open

      integer         nf__open
!                         (character*(*)       path,
!                          integer             mode,
!                          integer             chunksizehint,
!                          integer             ncid)
      external        nf__open

      integer         nf__open_mp
!                         (character*(*)       path,
!                          integer             mode,
!                          integer             basepe,
!                          integer             chunksizehint,
!                          integer             ncid)
      external        nf__open_mp

      integer         nf_set_fill
!                         (integer             ncid,
!                          integer             fillmode,
!                          integer             old_mode)
      external        nf_set_fill

      integer         nf_set_default_format
!                          (integer             format,
!                          integer             old_format)
      external        nf_set_default_format

      integer         nf_redef
!                         (integer             ncid)
      external        nf_redef

      integer         nf_enddef
!                         (integer             ncid)
      external        nf_enddef

      integer         nf__enddef
!                         (integer             ncid,
!                          integer             h_minfree,
!                          integer             v_align,
!                          integer             v_minfree,
!                          integer             r_align)
      external        nf__enddef

      integer         nf_sync
!                         (integer             ncid)
      external        nf_sync

      integer         nf_abort
!                         (integer             ncid)
      external        nf_abort

      integer         nf_close
!                         (integer             ncid)
      external        nf_close

      integer         nf_delete
!                         (character*(*)       ncid)
      external        nf_delete

!
! general inquiry routines:
!

      integer         nf_inq
!                         (integer             ncid,
!                          integer             ndims,
!                          integer             nvars,
!                          integer             ngatts,
!                          integer             unlimdimid)
      external        nf_inq

! new inquire path

      integer nf_inq_path
      external nf_inq_path

      integer         nf_inq_ndims
!                         (integer             ncid,
!                          integer             ndims)
      external        nf_inq_ndims

      integer         nf_inq_nvars
!                         (integer             ncid,
!                          integer             nvars)
      external        nf_inq_nvars

      integer         nf_inq_natts
!                         (integer             ncid,
!                          integer             ngatts)
      external        nf_inq_natts

      integer         nf_inq_unlimdim
!                         (integer             ncid,
!                          integer             unlimdimid)
      external        nf_inq_unlimdim

      integer         nf_inq_format
!                         (integer             ncid,
!                          integer             format)
      external        nf_inq_format

!
! dimension routines:
!

      integer         nf_def_dim
!                         (integer             ncid,
!                          character(*)        name,
!                          integer             len,
!                          integer             dimid)
      external        nf_def_dim

      integer         nf_inq_dimid
!                         (integer             ncid,
!                          character(*)        name,
!                          integer             dimid)
      external        nf_inq_dimid

      integer         nf_inq_dim
!                         (integer             ncid,
!                          integer             dimid,
!                          character(*)        name,
!                          integer             len)
      external        nf_inq_dim

      integer         nf_inq_dimname
!                         (integer             ncid,
!                          integer             dimid,
!                          character(*)        name)
      external        nf_inq_dimname

      integer         nf_inq_dimlen
!                         (integer             ncid,
!                          integer             dimid,
!                          integer             len)
      external        nf_inq_dimlen

      integer         nf_rename_dim
!                         (integer             ncid,
!                          integer             dimid,
!                          character(*)        name)
      external        nf_rename_dim

!
! general attribute routines:
!

      integer         nf_inq_att
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             xtype,
!                          integer             len)
      external        nf_inq_att

      integer         nf_inq_attid
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             attnum)
      external        nf_inq_attid

      integer         nf_inq_atttype
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             xtype)
      external        nf_inq_atttype

      integer         nf_inq_attlen
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             len)
      external        nf_inq_attlen

      integer         nf_inq_attname
!                         (integer             ncid,
!                          integer             varid,
!                          integer             attnum,
!                          character(*)        name)
      external        nf_inq_attname

      integer         nf_copy_att
!                         (integer             ncid_in,
!                          integer             varid_in,
!                          character(*)        name,
!                          integer             ncid_out,
!                          integer             varid_out)
      external        nf_copy_att

      integer         nf_rename_att
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        curname,
!                          character(*)        newname)
      external        nf_rename_att

      integer         nf_del_att
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name)
      external        nf_del_att

!
! attribute put/get routines:
!

      integer         nf_put_att_text
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             len,
!                          character(*)        text)
      external        nf_put_att_text

      integer         nf_get_att_text
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          character(*)        text)
      external        nf_get_att_text

      integer         nf_put_att_int1
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             xtype,
!                          integer             len,
!                          nf_int1_t           i1vals(1))
      external        nf_put_att_int1

      integer         nf_get_att_int1
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          nf_int1_t           i1vals(1))
      external        nf_get_att_int1

      integer         nf_put_att_int2
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             xtype,
!                          integer             len,
!                          nf_int2_t           i2vals(1))
      external        nf_put_att_int2

      integer         nf_get_att_int2
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          nf_int2_t           i2vals(1))
      external        nf_get_att_int2

      integer         nf_put_att_int
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             xtype,
!                          integer             len,
!                          integer             ivals(1))
      external        nf_put_att_int

      integer         nf_get_att_int
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             ivals(1))
      external        nf_get_att_int

      integer         nf_put_att_real
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             xtype,
!                          integer             len,
!                          real                rvals(1))
      external        nf_put_att_real

      integer         nf_get_att_real
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          real                rvals(1))
      external        nf_get_att_real

      integer         nf_put_att_double
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             xtype,
!                          integer             len,
!                          double              dvals(1))
      external        nf_put_att_double

      integer         nf_get_att_double
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          double              dvals(1))
      external        nf_get_att_double

!
! general variable routines:
!

      integer         nf_def_var
!                         (integer             ncid,
!                          character(*)        name,
!                          integer             datatype,
!                          integer             ndims,
!                          integer             dimids(1),
!                          integer             varid)
      external        nf_def_var

      integer         nf_inq_var
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             datatype,
!                          integer             ndims,
!                          integer             dimids(1),
!                          integer             natts)
      external        nf_inq_var

      integer         nf_inq_varid
!                         (integer             ncid,
!                          character(*)        name,
!                          integer             varid)
      external        nf_inq_varid

      integer         nf_inq_varname
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name)
      external        nf_inq_varname

      integer         nf_inq_vartype
!                         (integer             ncid,
!                          integer             varid,
!                          integer             xtype)
      external        nf_inq_vartype

      integer         nf_inq_varndims
!                         (integer             ncid,
!                          integer             varid,
!                          integer             ndims)
      external        nf_inq_varndims

      integer         nf_inq_vardimid
!                         (integer             ncid,
!                          integer             varid,
!                          integer             dimids(1))
      external        nf_inq_vardimid

      integer         nf_inq_varnatts
!                         (integer             ncid,
!                          integer             varid,
!                          integer             natts)
      external        nf_inq_varnatts

      integer         nf_rename_var
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name)
      external        nf_rename_var

      integer         nf_copy_var
!                         (integer             ncid_in,
!                          integer             varid,
!                          integer             ncid_out)
      external        nf_copy_var

!
! entire variable put/get routines:
!

      integer         nf_put_var_text
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        text)
      external        nf_put_var_text

      integer         nf_get_var_text
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        text)
      external        nf_get_var_text

      integer         nf_put_var_int1
!                         (integer             ncid,
!                          integer             varid,
!                          nf_int1_t           i1vals(1))
      external        nf_put_var_int1

      integer         nf_get_var_int1
!                         (integer             ncid,
!                          integer             varid,
!                          nf_int1_t           i1vals(1))
      external        nf_get_var_int1

      integer         nf_put_var_int2
!                         (integer             ncid,
!                          integer             varid,
!                          nf_int2_t           i2vals(1))
      external        nf_put_var_int2

      integer         nf_get_var_int2
!                         (integer             ncid,
!                          integer             varid,
!                          nf_int2_t           i2vals(1))
      external        nf_get_var_int2

      integer         nf_put_var_int
!                         (integer             ncid,
!                          integer             varid,
!                          integer             ivals(1))
      external        nf_put_var_int

      integer         nf_get_var_int
!                         (integer             ncid,
!                          integer             varid,
!                          integer             ivals(1))
      external        nf_get_var_int

      integer         nf_put_var_real
!                         (integer             ncid,
!                          integer             varid,
!                          real                rvals(1))
      external        nf_put_var_real

      integer         nf_get_var_real
!                         (integer             ncid,
!                          integer             varid,
!                          real                rvals(1))
      external        nf_get_var_real

      integer         nf_put_var_double
!                         (integer             ncid,
!                          integer             varid,
!                          doubleprecision     dvals(1))
      external        nf_put_var_double

      integer         nf_get_var_double
!                         (integer             ncid,
!                          integer             varid,
!                          doubleprecision     dvals(1))
      external        nf_get_var_double

!
! single variable put/get routines:
!

      integer         nf_put_var1_text
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          character*1         text)
      external        nf_put_var1_text

      integer         nf_get_var1_text
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          character*1         text)
      external        nf_get_var1_text

      integer         nf_put_var1_int1
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          nf_int1_t           i1val)
      external        nf_put_var1_int1

      integer         nf_get_var1_int1
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          nf_int1_t           i1val)
      external        nf_get_var1_int1

      integer         nf_put_var1_int2
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          nf_int2_t           i2val)
      external        nf_put_var1_int2

      integer         nf_get_var1_int2
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          nf_int2_t           i2val)
      external        nf_get_var1_int2

      integer         nf_put_var1_int
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          integer             ival)
      external        nf_put_var1_int

      integer         nf_get_var1_int
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          integer             ival)
      external        nf_get_var1_int

      integer         nf_put_var1_real
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          real                rval)
      external        nf_put_var1_real

      integer         nf_get_var1_real
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          real                rval)
      external        nf_get_var1_real

      integer         nf_put_var1_double
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          doubleprecision     dval)
      external        nf_put_var1_double

      integer         nf_get_var1_double
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          doubleprecision     dval)
      external        nf_get_var1_double

!
! variable array put/get routines:
!

      integer         nf_put_vara_text
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          character(*)        text)
      external        nf_put_vara_text

      integer         nf_get_vara_text
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          character(*)        text)
      external        nf_get_vara_text

      integer         nf_put_vara_int1
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          nf_int1_t           i1vals(1))
      external        nf_put_vara_int1

      integer         nf_get_vara_int1
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          nf_int1_t           i1vals(1))
      external        nf_get_vara_int1

      integer         nf_put_vara_int2
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          nf_int2_t           i2vals(1))
      external        nf_put_vara_int2

      integer         nf_get_vara_int2
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          nf_int2_t           i2vals(1))
      external        nf_get_vara_int2

      integer         nf_put_vara_int
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             ivals(1))
      external        nf_put_vara_int

      integer         nf_get_vara_int
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             ivals(1))
      external        nf_get_vara_int

      integer         nf_put_vara_real
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          real                rvals(1))
      external        nf_put_vara_real

      integer         nf_get_vara_real
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          real                rvals(1))
      external        nf_get_vara_real

      integer         nf_put_vara_double
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          doubleprecision     dvals(1))
      external        nf_put_vara_double

      integer         nf_get_vara_double
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          doubleprecision     dvals(1))
      external        nf_get_vara_double

!
! strided variable put/get routines:
!

      integer         nf_put_vars_text
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          character(*)        text)
      external        nf_put_vars_text

      integer         nf_get_vars_text
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          character(*)        text)
      external        nf_get_vars_text

      integer         nf_put_vars_int1
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          nf_int1_t           i1vals(1))
      external        nf_put_vars_int1

      integer         nf_get_vars_int1
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          nf_int1_t           i1vals(1))
      external        nf_get_vars_int1

      integer         nf_put_vars_int2
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          nf_int2_t           i2vals(1))
      external        nf_put_vars_int2

      integer         nf_get_vars_int2
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          nf_int2_t           i2vals(1))
      external        nf_get_vars_int2

      integer         nf_put_vars_int
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             ivals(1))
      external        nf_put_vars_int

      integer         nf_get_vars_int
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             ivals(1))
      external        nf_get_vars_int

      integer         nf_put_vars_real
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          real                rvals(1))
      external        nf_put_vars_real

      integer         nf_get_vars_real
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          real                rvals(1))
      external        nf_get_vars_real

      integer         nf_put_vars_double
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          doubleprecision     dvals(1))
      external        nf_put_vars_double

      integer         nf_get_vars_double
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          doubleprecision     dvals(1))
      external        nf_get_vars_double

!
! mapped variable put/get routines:
!

      integer         nf_put_varm_text
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          character(*)        text)
      external        nf_put_varm_text

      integer         nf_get_varm_text
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          character(*)        text)
      external        nf_get_varm_text

      integer         nf_put_varm_int1
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          nf_int1_t           i1vals(1))
      external        nf_put_varm_int1

      integer         nf_get_varm_int1
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          nf_int1_t           i1vals(1))
      external        nf_get_varm_int1

      integer         nf_put_varm_int2
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          nf_int2_t           i2vals(1))
      external        nf_put_varm_int2

      integer         nf_get_varm_int2
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          nf_int2_t           i2vals(1))
      external        nf_get_varm_int2

      integer         nf_put_varm_int
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          integer             ivals(1))
      external        nf_put_varm_int

      integer         nf_get_varm_int
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          integer             ivals(1))
      external        nf_get_varm_int

      integer         nf_put_varm_real
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          real                rvals(1))
      external        nf_put_varm_real

      integer         nf_get_varm_real
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          real                rvals(1))
      external        nf_get_varm_real

      integer         nf_put_varm_double
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          doubleprecision     dvals(1))
      external        nf_put_varm_double

      integer         nf_get_varm_double
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          doubleprecision     dvals(1))
      external        nf_get_varm_double


!     NetCDF-4.
!     This is part of netCDF-4. Copyright 2006, UCAR, See COPYRIGHT
!     file for distribution information.

!     Netcdf version 4 fortran interface.

!     $Id: netcdf4.inc,v 1.28 2010/05/25 13:53:02 ed Exp $

!     New netCDF-4 types.
      integer nf_ubyte
      integer nf_ushort
      integer nf_uint
      integer nf_int64
      integer nf_uint64
      integer nf_string
      integer nf_vlen
      integer nf_opaque
      integer nf_enum
      integer nf_compound

      parameter (nf_ubyte = 7)
      parameter (nf_ushort = 8)
      parameter (nf_uint = 9)
      parameter (nf_int64 = 10)
      parameter (nf_uint64 = 11)
      parameter (nf_string = 12)
      parameter (nf_vlen = 13)
      parameter (nf_opaque = 14)
      parameter (nf_enum = 15)
      parameter (nf_compound = 16)

!     New netCDF-4 fill values.
      integer           nf_fill_ubyte
      integer           nf_fill_ushort
!      real              nf_fill_uint
!      real              nf_fill_int64
!      real              nf_fill_uint64
      parameter (nf_fill_ubyte = 255)
      parameter (nf_fill_ushort = 65535)

!     New constants.
      integer nf_format_netcdf4
      parameter (nf_format_netcdf4 = 3)

      integer nf_format_netcdf4_classic
      parameter (nf_format_netcdf4_classic = 4)

      integer nf_netcdf4
      parameter (nf_netcdf4 = 4096)

      integer nf_classic_model
      parameter (nf_classic_model = 256)

      integer nf_chunk_seq
      parameter (nf_chunk_seq = 0)
      integer nf_chunk_sub
      parameter (nf_chunk_sub = 1)
      integer nf_chunk_sizes
      parameter (nf_chunk_sizes = 2)

      integer nf_endian_native
      parameter (nf_endian_native = 0)
      integer nf_endian_little
      parameter (nf_endian_little = 1)
      integer nf_endian_big
      parameter (nf_endian_big = 2)

!     For NF_DEF_VAR_CHUNKING
      integer nf_chunked
      parameter (nf_chunked = 0)
      integer nf_contiguous
      parameter (nf_contiguous = 1)

!     For NF_DEF_VAR_FLETCHER32
      integer nf_nochecksum
      parameter (nf_nochecksum = 0)
      integer nf_fletcher32
      parameter (nf_fletcher32 = 1)

!     For NF_DEF_VAR_DEFLATE
      integer nf_noshuffle
      parameter (nf_noshuffle = 0)
      integer nf_shuffle
      parameter (nf_shuffle = 1)

!     For NF_DEF_VAR_SZIP
      integer nf_szip_ec_option_mask
      parameter (nf_szip_ec_option_mask = 4)
      integer nf_szip_nn_option_mask
      parameter (nf_szip_nn_option_mask = 32)

!     For parallel I/O.
      integer nf_mpiio      
      parameter (nf_mpiio = 8192)
      integer nf_mpiposix
      parameter (nf_mpiposix = 16384)
      integer nf_pnetcdf
      parameter (nf_pnetcdf = 32768)

!     For NF_VAR_PAR_ACCESS.
      integer nf_independent
      parameter (nf_independent = 0)
      integer nf_collective
      parameter (nf_collective = 1)

!     New error codes.
      integer nf_ehdferr        ! Error at HDF5 layer. 
      parameter (nf_ehdferr = -101)
      integer nf_ecantread      ! Can't read. 
      parameter (nf_ecantread = -102)
      integer nf_ecantwrite     ! Can't write. 
      parameter (nf_ecantwrite = -103)
      integer nf_ecantcreate    ! Can't create. 
      parameter (nf_ecantcreate = -104)
      integer nf_efilemeta      ! Problem with file metadata. 
      parameter (nf_efilemeta = -105)
      integer nf_edimmeta       ! Problem with dimension metadata. 
      parameter (nf_edimmeta = -106)
      integer nf_eattmeta       ! Problem with attribute metadata. 
      parameter (nf_eattmeta = -107)
      integer nf_evarmeta       ! Problem with variable metadata. 
      parameter (nf_evarmeta = -108)
      integer nf_enocompound    ! Not a compound type. 
      parameter (nf_enocompound = -109)
      integer nf_eattexists     ! Attribute already exists. 
      parameter (nf_eattexists = -110)
      integer nf_enotnc4        ! Attempting netcdf-4 operation on netcdf-3 file.   
      parameter (nf_enotnc4 = -111)
      integer nf_estrictnc3     ! Attempting netcdf-4 operation on strict nc3 netcdf-4 file.   
      parameter (nf_estrictnc3 = -112)
      integer nf_enotnc3        ! Attempting netcdf-3 operation on netcdf-4 file.   
      parameter (nf_enotnc3 = -113)
      integer nf_enopar         ! Parallel operation on file opened for non-parallel access.   
      parameter (nf_enopar = -114)
      integer nf_eparinit       ! Error initializing for parallel access.   
      parameter (nf_eparinit = -115)
      integer nf_ebadgrpid      ! Bad group ID.   
      parameter (nf_ebadgrpid = -116)
      integer nf_ebadtypid      ! Bad type ID.   
      parameter (nf_ebadtypid = -117)
      integer nf_etypdefined    ! Type has already been defined and may not be edited. 
      parameter (nf_etypdefined = -118)
      integer nf_ebadfield      ! Bad field ID.   
      parameter (nf_ebadfield = -119)
      integer nf_ebadclass      ! Bad class.   
      parameter (nf_ebadclass = -120)
      integer nf_emaptype       ! Mapped access for atomic types only.   
      parameter (nf_emaptype = -121)
      integer nf_elatefill      ! Attempt to define fill value when data already exists. 
      parameter (nf_elatefill = -122)
      integer nf_elatedef       ! Attempt to define var properties, like deflate, after enddef. 
      parameter (nf_elatedef = -123)
      integer nf_edimscale      ! Probem with HDF5 dimscales. 
      parameter (nf_edimscale = -124)
      integer nf_enogrp       ! No group found.
      parameter (nf_enogrp = -125)


!     New functions.

!     Parallel I/O.
      integer nf_create_par
      external nf_create_par

      integer nf_open_par
      external nf_open_par

      integer nf_var_par_access
      external nf_var_par_access

!     Functions to handle groups.
      integer nf_inq_ncid
      external nf_inq_ncid

      integer nf_inq_grps
      external nf_inq_grps

      integer nf_inq_grpname
      external nf_inq_grpname

      integer nf_inq_grpname_full
      external nf_inq_grpname_full

      integer nf_inq_grpname_len
      external nf_inq_grpname_len

      integer nf_inq_grp_parent
      external nf_inq_grp_parent

      integer nf_inq_grp_ncid
      external nf_inq_grp_ncid

      integer nf_inq_grp_full_ncid
      external nf_inq_grp_full_ncid

      integer nf_inq_varids
      external nf_inq_varids

      integer nf_inq_dimids
      external nf_inq_dimids

      integer nf_def_grp
      external nf_def_grp

!     New rename grp function

      integer nf_rename_grp
      external nf_rename_grp

!     New options for netCDF variables.
      integer nf_def_var_deflate
      external nf_def_var_deflate

      integer nf_inq_var_deflate
      external nf_inq_var_deflate

      integer nf_def_var_fletcher32
      external nf_def_var_fletcher32

      integer nf_inq_var_fletcher32
      external nf_inq_var_fletcher32

      integer nf_def_var_chunking
      external nf_def_var_chunking

      integer nf_inq_var_chunking
      external nf_inq_var_chunking

      integer nf_def_var_fill
      external nf_def_var_fill

      integer nf_inq_var_fill
      external nf_inq_var_fill

      integer nf_def_var_endian
      external nf_def_var_endian

      integer nf_inq_var_endian
      external nf_inq_var_endian

!     User defined types.
      integer nf_inq_typeids
      external nf_inq_typeids

      integer nf_inq_typeid
      external nf_inq_typeid

      integer nf_inq_type
      external nf_inq_type

      integer nf_inq_user_type
      external nf_inq_user_type

!     User defined types - compound types.
      integer nf_def_compound
      external nf_def_compound

      integer nf_insert_compound
      external nf_insert_compound

      integer nf_insert_array_compound
      external nf_insert_array_compound

      integer nf_inq_compound
      external nf_inq_compound

      integer nf_inq_compound_name
      external nf_inq_compound_name

      integer nf_inq_compound_size
      external nf_inq_compound_size

      integer nf_inq_compound_nfields
      external nf_inq_compound_nfields

      integer nf_inq_compound_field
      external nf_inq_compound_field

      integer nf_inq_compound_fieldname
      external nf_inq_compound_fieldname

      integer nf_inq_compound_fieldindex
      external nf_inq_compound_fieldindex

      integer nf_inq_compound_fieldoffset
      external nf_inq_compound_fieldoffset

      integer nf_inq_compound_fieldtype
      external nf_inq_compound_fieldtype

      integer nf_inq_compound_fieldndims
      external nf_inq_compound_fieldndims

      integer nf_inq_compound_fielddim_sizes
      external nf_inq_compound_fielddim_sizes

!     User defined types - variable length arrays.
      integer nf_def_vlen
      external nf_def_vlen

      integer nf_inq_vlen
      external nf_inq_vlen

      integer nf_free_vlen
      external nf_free_vlen

!     User defined types - enums.
      integer nf_def_enum
      external nf_def_enum

      integer nf_insert_enum
      external nf_insert_enum

      integer nf_inq_enum
      external nf_inq_enum

      integer nf_inq_enum_member
      external nf_inq_enum_member

      integer nf_inq_enum_ident
      external nf_inq_enum_ident

!     User defined types - opaque.
      integer nf_def_opaque
      external nf_def_opaque

      integer nf_inq_opaque
      external nf_inq_opaque

!     Write and read attributes of any type, including user defined
!     types.
      integer nf_put_att
      external nf_put_att
      integer nf_get_att
      external nf_get_att

!     Write and read variables of any type, including user defined
!     types.
      integer nf_put_var
      external nf_put_var
      integer nf_put_var1
      external nf_put_var1
      integer nf_put_vara
      external nf_put_vara
      integer nf_put_vars
      external nf_put_vars
      integer nf_get_var
      external nf_get_var
      integer nf_get_var1
      external nf_get_var1
      integer nf_get_vara
      external nf_get_vara
      integer nf_get_vars
      external nf_get_vars

!     64-bit int functions.
      integer nf_put_var1_int64
      external nf_put_var1_int64
      integer nf_put_vara_int64
      external nf_put_vara_int64
      integer nf_put_vars_int64
      external nf_put_vars_int64
      integer nf_put_varm_int64
      external nf_put_varm_int64
      integer nf_put_var_int64
      external nf_put_var_int64
      integer nf_get_var1_int64
      external nf_get_var1_int64
      integer nf_get_vara_int64
      external nf_get_vara_int64
      integer nf_get_vars_int64
      external nf_get_vars_int64
      integer nf_get_varm_int64
      external nf_get_varm_int64
      integer nf_get_var_int64
      external nf_get_var_int64

!     For helping F77 users with VLENs.
      integer nf_get_vlen_element
      external nf_get_vlen_element
      integer nf_put_vlen_element
      external nf_put_vlen_element

!     For dealing with file level chunk cache.
      integer nf_set_chunk_cache
      external nf_set_chunk_cache
      integer nf_get_chunk_cache
      external nf_get_chunk_cache

!     For dealing with per variable chunk cache.
      integer nf_set_var_chunk_cache
      external nf_set_var_chunk_cache
      integer nf_get_var_chunk_cache
      external nf_get_var_chunk_cache

!     NetCDF-2.
!ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
! begin netcdf 2.4 backward compatibility:
!

!      
! functions in the fortran interface
!
      integer nccre
      integer ncopn
      integer ncddef
      integer ncdid
      integer ncvdef
      integer ncvid
      integer nctlen
      integer ncsfil

      external nccre
      external ncopn
      external ncddef
      external ncdid
      external ncvdef
      external ncvid
      external nctlen
      external ncsfil


      integer ncrdwr
      integer nccreat
      integer ncexcl
      integer ncindef
      integer ncnsync
      integer nchsync
      integer ncndirty
      integer nchdirty
      integer nclink
      integer ncnowrit
      integer ncwrite
      integer ncclob
      integer ncnoclob
      integer ncglobal
      integer ncfill
      integer ncnofill
      integer maxncop
      integer maxncdim
      integer maxncatt
      integer maxncvar
      integer maxncnam
      integer maxvdims
      integer ncnoerr
      integer ncebadid
      integer ncenfile
      integer nceexist
      integer nceinval
      integer nceperm
      integer ncenotin
      integer nceindef
      integer ncecoord
      integer ncemaxds
      integer ncename
      integer ncenoatt
      integer ncemaxat
      integer ncebadty
      integer ncebadd
      integer ncests
      integer nceunlim
      integer ncemaxvs
      integer ncenotvr
      integer nceglob
      integer ncenotnc
      integer ncfoobar
      integer ncsyserr
      integer ncfatal
      integer ncverbos
      integer ncentool


!
! netcdf data types:
!
      integer ncbyte
      integer ncchar
      integer ncshort
      integer nclong
      integer ncfloat
      integer ncdouble

      parameter(ncbyte = 1)
      parameter(ncchar = 2)
      parameter(ncshort = 3)
      parameter(nclong = 4)
      parameter(ncfloat = 5)
      parameter(ncdouble = 6)

!     
!     masks for the struct nc flag field; passed in as 'mode' arg to
!     nccreate and ncopen.
!     

!     read/write, 0 => readonly 
      parameter(ncrdwr = 1)
!     in create phase, cleared by ncendef 
      parameter(nccreat = 2)
!     on create destroy existing file 
      parameter(ncexcl = 4)
!     in define mode, cleared by ncendef 
      parameter(ncindef = 8)
!     synchronise numrecs on change (x'10')
      parameter(ncnsync = 16)
!     synchronise whole header on change (x'20')
      parameter(nchsync = 32)
!     numrecs has changed (x'40')
      parameter(ncndirty = 64)  
!     header info has changed (x'80')
      parameter(nchdirty = 128)
!     prefill vars on endef and increase of record, the default behavior
      parameter(ncfill = 0)
!     do not fill vars on endef and increase of record (x'100')
      parameter(ncnofill = 256)
!     isa link (x'8000')
      parameter(nclink = 32768)

!     
!     'mode' arguments for nccreate and ncopen
!     
      parameter(ncnowrit = 0)
      parameter(ncwrite = ncrdwr)
      parameter(ncclob = nf_clobber)
      parameter(ncnoclob = nf_noclobber)

!     
!     'size' argument to ncdimdef for an unlimited dimension
!     
      integer ncunlim
      parameter(ncunlim = 0)

!     
!     attribute id to put/get a global attribute
!     
      parameter(ncglobal  = 0)

!     
!     advisory maximums:
!     
      parameter(maxncop = 64)
      parameter(maxncdim = 1024)
      parameter(maxncatt = 8192)
      parameter(maxncvar = 8192)
!     not enforced 
      parameter(maxncnam = 256)
      parameter(maxvdims = maxncdim)

!     
!     global netcdf error status variable
!     initialized in error.c
!     

!     no error 
      parameter(ncnoerr = nf_noerr)
!     not a netcdf id 
      parameter(ncebadid = nf_ebadid)
!     too many netcdfs open 
      parameter(ncenfile = -31)   ! nc_syserr
!     netcdf file exists && ncnoclob
      parameter(nceexist = nf_eexist)
!     invalid argument 
      parameter(nceinval = nf_einval)
!     write to read only 
      parameter(nceperm = nf_eperm)
!     operation not allowed in data mode 
      parameter(ncenotin = nf_enotindefine )   
!     operation not allowed in define mode 
      parameter(nceindef = nf_eindefine)   
!     coordinates out of domain 
      parameter(ncecoord = nf_einvalcoords)
!     maxncdims exceeded 
      parameter(ncemaxds = nf_emaxdims)
!     string match to name in use 
      parameter(ncename = nf_enameinuse)   
!     attribute not found 
      parameter(ncenoatt = nf_enotatt)
!     maxncattrs exceeded 
      parameter(ncemaxat = nf_emaxatts)
!     not a netcdf data type 
      parameter(ncebadty = nf_ebadtype)
!     invalid dimension id 
      parameter(ncebadd = nf_ebaddim)
!     ncunlimited in the wrong index 
      parameter(nceunlim = nf_eunlimpos)
!     maxncvars exceeded 
      parameter(ncemaxvs = nf_emaxvars)
!     variable not found 
      parameter(ncenotvr = nf_enotvar)
!     action prohibited on ncglobal varid 
      parameter(nceglob = nf_eglobal)
!     not a netcdf file 
      parameter(ncenotnc = nf_enotnc)
      parameter(ncests = nf_ests)
      parameter (ncentool = nf_emaxname) 
      parameter(ncfoobar = 32)
      parameter(ncsyserr = -31)

!     
!     global options variable. used to determine behavior of error handler.
!     initialized in lerror.c
!     
      parameter(ncfatal = 1)
      parameter(ncverbos = 2)

!
!     default fill values.  these must be the same as in the c interface.
!
      integer filbyte
      integer filchar
      integer filshort
      integer fillong
      real filfloat
      doubleprecision fildoub

      parameter (filbyte = -127)
      parameter (filchar = 0)
      parameter (filshort = -32767)
      parameter (fillong = -2147483647)
      parameter (filfloat = 9.9692099683868690e+36)
      parameter (fildoub = 9.9692099683868690e+36)

!========================
! lastObs structure, corresponding to nudgingLastObs.YYYY-mm-dd_HH:MM:ss.nc
! How observations from the past are carried forward.
! This type is extended in module_stream_nudging
type lastObsStructure
   character(len=15)                            :: usgsId
   real,              allocatable, dimension(:) :: lastObsDischarge
   real,              allocatable, dimension(:) :: lastObsModelDischarge
   character(len=19), allocatable, dimension(:) :: lastObsTime
   real,              allocatable, dimension(:) :: lastObsQuality
end type lastObsStructure

integer, parameter :: did = 1

contains

!===================================================================================================
! Program Name: 
!   subroutine find_timeslice_file
! Author(s)/Contact(s): 
!   James L McCreight <jamesmcc><ucar><edu>
! Abstract: 
!   Return a single file path/names of timeslice files given a single date.
! History Log: 
!   6/4/15 - Created,
! Usage:
! Parameters: 
!   q
! Input Files:  
! Output Files: 
! Condition codes: 
! User controllable options: namelist option for nlst_rt(did)%timeSlicePath
! Notes: 

function find_timeslice_file(date, obsResolution)            
implicit none
character(len=256) :: find_timeslice_file      ! Output
character(len=19), intent(in) :: date          ! Input
character(len=2),  intent(in) :: obsResolution ! Input
!Internals
character(len=256) :: tmpTimeSlice 
logical :: fileExists

print*,'Ndg: start find_timeslice_file'
call flush(6)

find_timeslice_file=''
! is there a file with this name?
! note files are not resolved below minutes.
tmpTimeSlice = trim(nlst_rt(did)%timeSlicePath) // date // "." // &
                    obsResolution // 'min.usgsTimeSlice.ncdf'
inquire(FILE=tmpTimeSlice, EXIST=fileExists)
if (fileExists) find_timeslice_file = trim(tmpTimeSlice)

print*,'Ndg: timeSlice file: ', tmpTimeSlice
print*,'Ndg: file found: ', fileExists
print*,'Ndg: finish find_timeslice_file'
call flush(6)

end function find_timeslice_file

!===================================================================================================
! Program Name: 
!   subroutine read_timeslice_file
! Author(s)/Contact(s): 
!   James L McCreight <jamesmcc><ucar><edu>
! Abstract: 
!   Return the contents of a timeslice file.
! History Log: 
!   6/4/15 - Created,
! Usage:
! Parameters: 
!   
! Input Files:  
! Output Files: 
! Condition codes: 
! User controllable options: namelist option for nlst_rt(did)%timeSlicePath
! Notes: 
 
subroutine read_timeslice_file(  &
     timeSliceFile,              &  !! IN: char, file path/name
     sanityQcDischarge,          &  !! IN: perform sanity check qc?
     sliceTime,                  &  !! OUT: the file time.
     updateTime,                 &  !! OUT: the time the file was updated.
     sliceResolution,            &  !! OUT: temporal resolution of the file in minutes.
     gageId,                     &  !! OUT: integer, the USGS gage ID. 
     gageTime,                   &  !! OUT: output converted for comparision to model time??
     gageQC,                     &  !! OUT: quality control flag for discharge
     gageDischarge,              &  !! OUT: real, the m3/s observed discharge
     fatalErr,                   &  !! IN:  logical, are IO errors fatal?
     errStatus                   &  !! OUT: count of errors encountered
                                 )

implicit none
character(len=256), intent(in)                :: timeSliceFile
logical,            intent(in)                :: sanityQcDischarge
character(len=19),  intent(out)               :: sliceTime
character(len=19),  intent(out)               :: updateTime
character(len=2),   intent(out)               :: sliceResolution
character(len=15),  intent(out), dimension(:) :: gageId
character(len=19),  intent(out), dimension(:) :: gageTime
real,               intent(out), dimension(:) :: gageQC
real,               intent(out), dimension(:) :: gageDischarge
logical,            intent(in)                :: fatalErr
integer,            intent(out)               :: errStatus

integer*2, allocatable, dimension(:) :: gageQCIn
integer :: iRet, ncId, fileNameLen, errStatusOut
character(len=19) :: caller
real, parameter :: zero = 0.0000000000000
real, parameter :: oneHundred = 100.0000000000000

print*,'Ndg: start read_timeslice_file'
write(*,'("Ndg: read_timeslice_file: ''", A, "''")') trim(timeSliceFile)
call flush(6)

caller = 'read_timeslice_file'
errStatus=0

iRet = nf90_open(trim(timeSliceFile), nf90_nowrite, ncid)
if (iRet /= nf90_NoErr) then
   write(*,'("Problem opening timeSliceFile: ''", A, "''")') trim(timeSliceFile)
   if(fatalErr) call hydro_stop('read_timeslice_file')
   errStatus=errStatus+1
endif

!! global atts
iRet = nf90_get_att(ncid, nf90_global, 'sliceCenterTimeUTC',         sliceTime)
if (iRet /= nf90_NoErr) errStatus=errStatus+1
iRet = nf90_get_att(ncid, nf90_global, 'fileUpdateTimeUTC',          updateTime)
if (iRet /= nf90_NoErr) errStatus=errStatus+1
iRet = nf90_get_att(ncid, nf90_global, 'sliceTimeResolutionMinutes', sliceResolution)
if (iRet /= nf90_NoErr) errStatus=errStatus+1

! variables
call get_1d_netcdf_text(ncid, 'stationId', gageId,        caller, &
                        fatalErr, errStatusOut)
errStatus=errStatus+errStatusOut
call get_1d_netcdf_text(ncid, 'time',      gageTime,      caller, &
                        fatalErr, errStatusOut)
errStatus=errStatus+errStatusOut
call get_1d_netcdf_real(ncid, 'discharge', gageDischarge, caller, &
                        fatalErr, errStatusOut)
errStatus=errStatus+errStatusOut

!! the quality short integer needs scaled
allocate(gageQCIn(size(gageQC))) 
call get_1d_netcdf_int2(ncid, 'discharge_quality', gageQCIn,        caller, &
                        fatalErr, errStatusOut)
errStatus=errStatus+errStatusOut
gageQC=gageQCIn/oneHundred
deallocate(gageQCIn)

!! JLM TODO fix temporary hardwire QC sanity checks
if (sanityQcDischarge) then
   !! First, quality check on the quality flag!
   where(gageQC .lt. 0 .or. gageQC .gt. 1) gageQC=0
   !! Now flow QC.
   where(gageDischarge .le. 0.000) gageQC=0
   !! peak flow on MS river *2
   !! http://nwis.waterdata.usgs.gov/nwis/peak?site_no=07374000&agency_cd=USGS&format=html
   !! baton rouge 1945: 1,473,000cfs=41,711cfs, multiply it roughly by 2
   where(gageDischarge .ge. 90000.0) gageQC=0
   if(any(gageQc .eq. 0)) then
      write(6,*) 'Ndg: some gageQC set to zero'  
   endif
endif
 
iRet = nf90_close(ncId)
if (iRet /= nf90_NoErr) then
   write(*,'("Problem closing timeSliceFile: ''", A, "''")') trim(timeSliceFile)
   if(fatalErr) call hydro_stop('read_timeslice_file')
   errStatus=errStatus+1
endif

print*,'Ndg: finish read_timeslice_file'  
call flush(6)!

end subroutine read_timeslice_file

!===================================================================================================
! Program Name: 
!   subroutine read_reach_gage_collocation
! Author(s)/Contact(s): 
!   James L McCreight <jamesmcc><ucar><edu>
! Abstract: 
!   Read the gages column from the "RouteLink.nc" netcdf file specifing the channel topology. 
! History Log: 
!   7/20/15 -Created, JLM.
! Usage:
! Parameters: 
! Input Files: 
!   netcdf file RouteLink.nc or other name ending with .nc.
! Output Files:
! Condition codes: 
! User controllable options:
! Notes: Currently no csv support, but basic code is in place though commented out.

subroutine read_reach_gage_collocation(gageIds)
use module_namelist, only: nlst_rt
implicit none
character(len=15), dimension(:), intent(out) :: gageIds
!integer, dimension(:), intent(out) :: gageIds

integer               :: ncid , iRet, varId
logical               :: fatal_if_error
character(len=256) :: route_link_f_r, route_link_f, varName
integer :: lenRouteLinkFR ! so the preceeding var chan be changed without changing code
logical :: routeLinkNetcdf

print*,'Ndg: Starting read_reach_gage_collocation'

varName = 'gages'
!! is RouteLink file netcdf (*.nc) or csv (*.csv)
route_link_f   = nlst_rt(did)%route_link_f
route_link_f_r = adjustr(route_link_f)
lenRouteLinkFR = len(route_link_f_r)
routeLinkNetcdf = route_link_f_r( (lenRouteLinkFR-2):lenRouteLinkFR) .eq. '.nc'

if(routeLinkNetcdf) then 

!! part of this could become a get_1d_netcdf
   iRet = nf90_open(trim(route_link_f), nf90_NoWrite, ncId)
   if (iRet /= nf90_NoErr) then
      write(6,'("read_reach_gage_collocation: Problem opening file ''", A, "''")') trim(route_link_f)
      call hydro_stop("read_reach_gage_collocation")
   endif
   
   iRet = nf90_inq_varid(ncid, varName, varid)
   if (iRet /= nf90_NoErr) then
      print*,"Ndg: read_reach_gage_collocation: variable: " // trim(varName)
      call hydro_stop("read_reach_gage_collocation")
   end if

   iRet = nf90_get_var(ncid, varid, gageIds)
   if (iRet /= nf90_NoErr) then
      print*,"Ndg: read_reach_gage_collocation: value: " // trim(varName)
      call hydro_stop("read_reach_gage_collocation")
   end if

   iRet = nf90_close(ncid)
   if (iRet /= nf90_NoErr) then
      print*,"Ndg: read_reach_gage_collocation: closing: " // trim(varName)
      call hydro_stop("read_reach_gage_collocation")
   end if

else   
   call hydro_stop('read_reach_gage_collocation: csv not currently supported.')
   !! here's some code to start from if/when we do want to support csv for this.
   !open(unit=79,file=trim(route_link_f),form='formatted',status='old')
   !read(79,*)  header
   !print *, "header ", header, "NLINKSL = ", NLINKSL, GNLINKSL
   !call flush(6)
   !do i=1,GNLINKSL
   !   read (79,*) tmpLINKID(i),   tmpFROM_NODE(i), tmpTO_NODE(i), tmpCHLON(i),    &
   !        tmpCHLAT(i),    tmpZELEV(i),     tmpTYPEL(i),   tmpORDER(i),    &
   !        tmpQLINK(i,1),  tmpMUSK(i),      tmpMUSX(i),    tmpCHANLEN(i),  &
   !        tmpMannN(i),    tmpSo(i),        tmpChSSlp(i),  tmpBw(i),       &
   !        tmpHRZAREA(i),  tmpLAKEMAXH(i),  tmpWEIRC(i),   tmpWEIRL(i),    &
   !        tmpORIFICEC(i), tmpORIFICEA(i),  tmpORIFICEE(i)
   !   ! if (So(i).lt.0.005) So(i) = 0.005  !-- impose a minimum slope requireement
   !   if (tmpORDER(i) .gt. MAXORDER) MAXORDER = tmpORDER(i)
   !end do
   !close(79)
end if ! routeLinkNetcdf

print*,'Ndg: Finish read_reach_gage_collocation'
call flush(6)

end subroutine read_reach_gage_collocation

!===================================================================================================
! Program Name: 
!   subroutine read_gridded_nudging_frxst_gage_csv
! Author(s)/Contact(s): 
!   James L McCreight <jamesmcc><ucar><edu>
! Abstract: 
!   For gridded channel routine, the mechanism is to use forecast points to 
!   identify gages. This file determines the collocation of the two. See the
!   file in the nudging/ directory for more info.
! History Log: 
!   6/22/15 -Created, JLM.
! Usage:
! Parameters: 
! Input Files: Nudging_frxst_gage.csv
! Output Files: 
! Condition codes: 
! User controllable options: 
! Notes:

subroutine read_gridded_nudging_frxst_gage_csv(frxstId, gageId, nGages) 
implicit none
integer,           dimension(:), intent(out) :: frxstId
character(len=15), dimension(:), intent(out) :: gageId
integer,                         intent(out) :: nGages

character(len=5000) :: line
integer :: ii, colCount, lineCount, lastCommaPos, tmpInt

print*,'Ndg: start read_gridded_nudging_frxst_gage_csv'
frxstId=-9999

lineCount = 0

open(117, file = 'Nudging_frxst_gage.csv' )
do
   read(117, '( a )', end = 200 ) line
   if( line( 1:1 ) == '!' ) cycle     
   colCount = 1
   lastCommaPos = 0
   do ii = 1, len( line )

      if( line( ii:ii ) == '!' ) exit

      if (ii .eq. 1) lineCount = lineCount + 1      

      if( line( ii:ii ) == ',' ) then 
         if(colCount .eq. 1) then 
            read (line((lastCommaPos+1):(ii-1)),'(I5)') tmpInt
            frxstId(lineCount) = tmpInt
         end if
         if(colCount .eq. 2) gageId(lineCount)  =  trim(line((lastCommaPos+1):(ii-1)))
         colCount = colCount + 1
         lastCommaPos = ii
      end if

      if(colCount .eq. 3) cycle

   end do
end do

close(117)

200 continue

nGages = lineCount
print*,"Ndg: nGages: ",  nGages
print*,"Ndg: frxstId: ", frxstId(1:nGages)
print*,"Ndg: gageId:",   gageId(1:nGages)
print*,'Ndg: finish read_gridded_nudging_frxst_gage_csv'
call flush(6)

end subroutine read_gridded_nudging_frxst_gage_csv

!===================================================================================================
! Program Name: 
!   subroutine read_nudging_param_file
! Author(s)/Contact(s): 
!   James L McCreight <jamesmcc><ucar><edu>
! Abstract: 
!   Set up the default nudging parameters with the model initialization. 
! History Log: 
!   6/22/15 -Created, JLM.
! Usage:
! Parameters: 
! Input Files: Nudging_frxst_gage.csv
! Output Files: 
! Condition codes: 
! User controllable options: 
! Notes:

subroutine read_nudging_param_file(  &
     paramFile,                      &  !! IN: char, file path/name
     gageId,                         &  !! OUT: integer, the USGS gage ID. 
     gageR,                          &  !! OUT: output converted for comparision to model time??
     gageG,                          &  !! OUT: quality control flag for discharge
     gageTau,                        &  !! OUT: real the half-window for NN/IDW interp
     gageQThresh,                    &  !! OUT: real the half-window for NN/IDW interp
     gageExpCoeff                    &  !! OUT: real, params for exponent-based temporal persistence
)
implicit none
character(len=256), intent(in)                    :: paramFile
character(len=15),  intent(out), dimension(:)     :: gageId
real,               intent(out), dimension(:)     :: gageR
real,               intent(out), dimension(:)     :: gageG
real,               intent(out), dimension(:)     :: gageTau
real,               intent(out), dimension(:,:,:) :: gageQThresh
real,               intent(out), dimension(:,:,:) :: gageExpCoeff

integer :: iRet, ncId, varId, dimId, fileNameLen, errStatus
character(len=23) :: caller

print*,'Ndg: start read_nudging_param_file'
write(*,'("Ndg: paramFile: ''", A, "''")') trim(paramFile)
call flush(6)

caller='read_nudging_param_file'

iRet = nf90_open(trim(paramFile), nf90_NoWrite, ncid)
if (iRet /= nf90_NoErr) then
   write(6,'("read_nudging_param_file: Problem opening file ''", A, "''")') trim(paramFile)
   call hydro_stop("read_nudging_param_file")
endif

call get_1d_netcdf_text(ncid, 'stationId', gageId,  caller, .TRUE., errStatus)
call get_1d_netcdf_real(ncid, 'R',         gageR,   caller, .TRUE., errStatus)
call get_1d_netcdf_real(ncid, 'G',         gageG,   caller, .TRUE., errStatus)
call get_1d_netcdf_real(ncid, 'tau',       gageTau, caller, .TRUE., errStatus)

if(size(gageExpCoeff,2) .ne. 0 .and. size(gageExpCoeff,3) .ne. 0) then
   call get_3d_netcdf_real(ncid, 'qThresh',  gageQThresh,  caller, .true., errStatus)
   call get_3d_netcdf_real(ncid, 'expCoeff', gageExpCoeff, caller, .true., errStatus)
end if
  
iRet = nf90_close(ncId)
if (iRet /= nf90_NoErr) then
   write(*,'("Problem closing paramFile: ''", A, "''")') trim(paramFile)
   call hydro_stop('read_nudging_param_file')
endif

print*,'Ndg: finish read_nudging_param_file' 
call flush(6)

end subroutine read_nudging_param_file


!===================================================================================================
! Subroutine Name: 
!   subroutine write_nwis_not_in_RLAndParams
! Author(s)/Contact(s): 
!   James L McCreight <jamesmcc><ucar><edu>
! Abstract: 
!   Write a log file of gages supplied by NWIS but which are not found in 
!   the intersection of our Route_Link gages and our parameter file gages. 
!   Perhaps they were not picked up by us as available, 
!   or they are simply not in NHD+.
! History Log: 
!   11/04/15 -Created, JLM.
! Usage:
! Parameters: 
! Input Files: 
! Output Files: 
! Condition codes: 
! User controllable options: None. 
! Notes:

subroutine write_nwis_not_in_RLAndParams( gageId, count )
implicit none
character(len=15), dimension(:),  intent(in) :: gageId
integer,                          intent(in) :: count
integer :: cc

open (unit=919,file='NWIS_gages_not_in_RLAndParams.txt',status='unknown',position='append')

do cc=1,count

   write(919,'(A15)') gageId(cc)

end do

close(919) 

end subroutine write_nwis_not_in_RLAndParams


!===================================================================================================
! Subroutine Name: 
!   subroutine write_nudging_last_obs
! Author(s)/Contact(s): 
!   James L McCreight <jamesmcc><ucar><edu>
! Abstract:
!   Write out the last observations collected over time.
! History Log: 
!   02/03/16 -Created, JLM.
! Usage:
! Parameters: 
! Input Files: 
! Output Files: 
! Condition codes: 
! User controllable options: None. 
! Notes:  Needs better error handling... 

subroutine write_nudging_last_obs(lastObsStr, modelTime, g_nudge)

implicit none

!Arugments
type(lastObsStructure), intent(in), dimension(:) :: lastObsStr
character(len=19),      intent(in)               :: modelTime
real,                   intent(in), dimension(:) :: g_nudge

! Local
character(len=37) :: outFileName
integer :: nSpace, nTime, nFeature, tt, ss
integer :: ncid, iret, varid, dimIdTimeStr, dimIdStnStr, dimIdNTime, dimIdNStn, dimIdNFeature
character(len=15), allocatable, dimension(:) :: charArr15
character(len=19), allocatable, dimension(:,:) :: charArr19
real,      allocatable, dimension(:,:) :: tmpFloat
integer*2, allocatable, dimension(:,:) :: qualityInt2

print*,'Ndg: start write_nudging_last_obs'
flush(6)

nSpace = size(lastObsStr)
nTime  = size(lastObsStr(1)%lastObsDischarge)
nFeature = size(g_nudge)

!           !1234567891123456789212345678931234567
outFileName='nudgingLastObs.' // modelTime // '.nc'

! create file
iret = nf90_create(outFileName, nf90_clobber, ncid)

! create dimensions
! station id has length of the number of gages
! feature id has length of the number of reaches/features.
iret = nf90_def_dim(ncid, "timeStrLen",      19,             dimIdTimeStr)
iret = nf90_def_dim(ncid, "timeInd",         nTime,          dimIdNTime)
iret = nf90_def_dim(ncid, "stationIdStrLen", 15,             dimIdStnStr)
iret = nf90_def_dim(ncid, "stationIdInd",    nf90_unlimited, dimIdNStn)
iret = nf90_def_dim(ncid, "feature_id",      nFeature,       dimIdNFeature)

!! gageId def var
iret = nf90_def_var(ncid, "stationId", nf90_char, (/ dimIdStnStr, dimIdNstn /), varid)
iret = nf90_put_att(ncid, varid, 'long_name', "USGS station identifer of length 15")
iret = nf90_def_var_deflate(ncid, varid, 0, 1, 2)

!! time def var
iret = nf90_def_var(ncid, "time", nf90_char, (/ dimIdTimeStr, dimIdNTime, dimIdNStn /), varid)
iret = nf90_put_att(ncid, varid, 'units', "UTC")
iret = nf90_put_att(ncid, varid, 'long_name', "YYYY-mm-dd_HH:MM:SS UTC")
iret = nf90_def_var_deflate(ncid, varid, 0, 1, 2)

! discharge def var
iret = nf90_def_var(ncid, "discharge", nf90_float, (/ dimIdNTime, dimIdNstn /), varid)
iret = nf90_put_att(ncid, varid, 'units', "m^3/s")
iret = nf90_put_att(ncid, varid, 'long_name', "Discharge.cubic_meters_per_second")
iret = nf90_def_var_deflate(ncid, varid, 0, 1, 2)

! model discharge def var
iret = nf90_def_var(ncid, "model_discharge", nf90_float, (/ dimIdNTime, dimIdNstn /), varid)
iret = nf90_put_att(ncid, varid, 'units', "m^3/s")
iret = nf90_put_att(ncid, varid, 'long_name', "modelDischarge.cubic_meters_per_second")
iret = nf90_def_var_deflate(ncid, varid, 0, 1, 2)

! discharge quality def var
iret = nf90_def_var(ncid, "discharge_quality", nf90_short, (/ dimIdNTime, dimIdNstn /), varid)
iret = nf90_put_att(ncid, varid, 'units', "-")
iret = nf90_put_att(ncid, varid, 'long_name', "Discharge quality 0 to 100 to be scaled by 100.")
iret = nf90_def_var_deflate(ncid, varid, 0, 1, 2)

! nudge def var
iret = nf90_def_var(ncid, "nudge", nf90_float, (/ dimIdNFeature /), varid)
iret = nf90_put_att(ncid, varid, 'units', "m3 s-1")
iret = nf90_put_att(ncid, varid, 'long_name', "Amount of stream flow alteration")
iret = nf90_def_var_deflate(ncid, varid, 0, 1, 2)

!! global attributes
iret = nf90_put_att(ncid, nf90_global, "modelTimeAtOutput", modelTime)

!! end definition
iret = nf90_enddef(ncid)

!! gageId write var
iret = nf90_inq_varid(ncid, "stationId", varid)
allocate(charArr15(nSpace))
charArr15=lastObsStr(:)%usgsId

iret = nf90_put_var(ncid, varid, charArr15)
deallocate(charArr15)

! time write var
iret = nf90_inq_varid(ncid, "time", varid)
allocate(charArr19(nTime,nSpace))
do tt=1,nTime
   do ss=1,nSpace
      charArr19(tt,ss) = lastObsStr(ss)%lastObsTime(tt)
   end do
end do
iret = nf90_put_var(ncid, varid, charArr19)
deallocate(charArr19)

! discharge write var
iret = nf90_inq_varid(ncid, "discharge", varid)
allocate(tmpFloat(nTime,nSpace))
do tt=1,nTime
   do ss=1,nSpace
      tmpFloat(tt,ss) = lastObsStr(ss)%lastObsDischarge(tt)
   end do
end do
iret = nf90_put_var(ncid, varid, tmpFloat)
deallocate(tmpFloat)

! model discharge write var
iret = nf90_inq_varid(ncid, "model_discharge", varid)
allocate(tmpFloat(nTime,nSpace))
do tt=1,nTime
   do ss=1,nSpace
      tmpFloat(tt,ss) = lastObsStr(ss)%lastObsModelDischarge(tt)
   end do
end do
iret = nf90_put_var(ncid, varid, tmpFloat)
deallocate(tmpFloat)

! discharge_quality write var
iret = nf90_inq_varid(ncid, "discharge_quality", varid)
allocate(qualityInt2(nTime,nSpace))
do tt=1,nTime
   do ss=1,nSpace
   qualityInt2(tt,ss) = nint(100*lastObsStr(ss)%lastObsQuality(tt), kind=2)
end do
end do
iret = nf90_put_var(ncid, varid, qualityInt2) 
deallocate(qualityInt2)

! discharge_quality write var
iret = nf90_inq_varid(ncid, "nudge", varid)
iret = nf90_put_var(ncid, varid, g_nudge) 

!! close
iret= nf90_close(ncid)

print*,'Ndg: end write_nudging_last_obs'
flush(6)

end subroutine write_nudging_last_obs


!===================================================================================================
! Program Name: 
!   subroutine find_nudging_last_obs_file
! Author(s)/Contact(s): 
!   James L McCreight <jamesmcc><ucar><edu>
! Abstract: 
!   Return a single file path/names of nudging last obs file given a single date.
! History Log: 
!   2/9/16 - Created,
! Usage:
! Parameters: 
!   date
! Input Files:  nudgingLastObs.YYYY-mm-dd_HH:MM:SS.nc
! Output Files: 
! Condition codes: 
! User controllable options:
! Notes: 

function find_nudging_last_obs_file(fileName)
implicit none
character(len=256) :: find_nudging_last_obs_file  ! Output
character(len=256), intent(in) :: fileName
!Internals
logical :: fileExists
print*,'Ndg: start find_nudging_last_obs_file'
flush(6)

find_nudging_last_obs_file=''
! is there a file with this name?
! note files are not resolved below minutes.
inquire(FILE=fileName, EXIST=fileExists)
if (fileExists) find_nudging_last_obs_file = trim(fileName)

print*,'Ndg: last obs file: ', trim(fileName)
print*,'Ndg: file found: ', fileExists
print*,'Ndg: finish find_nudging_last_obs_file'
flush(6)

end function find_nudging_last_obs_file


!===================================================================================================
! Subroutine Name: 
!   subroutine read_nudging_last_obs
! Author(s)/Contact(s): 
!   James L McCreight <jamesmcc><ucar><edu>
! Abstract:
!   read in the last observations collected over time.
! History Log: 
!   02/03/16 -Created, JLM.
! Usage:
! Parameters: 
! Input Files: 
! Output Files: 
! Condition codes: 
! User controllable options: None. 
! Notes: Needs better error handling... 

subroutine read_nudging_last_obs(fileName, lastObsStr, g_nudge)

implicit none
character(len=*),       intent(in)                  :: fileName
type(lastObsStructure), intent(inout), dimension(:) :: lastObsStr
real,                   intent(inout), dimension(:) :: g_nudge

integer :: nSpace, nTime, tt, ss
integer:: ncid, iret, varid
real,              allocatable, dimension(:,:) :: tmpFloat
integer*2,         allocatable, dimension(:,:) :: qualityInt2
character(len=19), allocatable, dimension(:,:) :: charArr19
character(len=15), allocatable, dimension(:)   :: charArr15

print*,'read_nudging_last_obs'

nSpace = size(lastObsStr)
nTime  = size(lastObsStr(1)%lastObsDischarge)

iret = nf90_open(fileName, nf90_nowrite, ncid)

!! gageId read var
allocate(charArr15(nSpace))
iret = nf90_inq_varid(ncid, "stationId", varid)
iret = nf90_get_var(ncid, varid, charArr15)
lastObsStr(:)%usgsId=charArr15
deallocate(charArr15)

! time read var
iret = nf90_inq_varid(ncid, "time", varid)
allocate(charArr19(nTime,nSpace))
iret = nf90_get_var(ncid, varid, charArr19)
do tt=1,nTime
   do ss=1,nSpace
      lastObsStr(ss)%lastObsTime(tt)=charArr19(tt,ss)
   end do
end do
deallocate(charArr19)

! discharge read var
iret = nf90_inq_varid(ncid, "discharge", varid)
allocate(tmpFloat(nTime,nSpace))
iret = nf90_get_var(ncid, varid, tmpFloat)
do tt=1,nTime
   do ss=1,nSpace
      lastObsStr(ss)%lastObsDischarge(tt) = tmpFloat(tt,ss)
   end do
end do
deallocate(tmpFloat)

! model discharge read var
iret = nf90_inq_varid(ncid, "model_discharge", varid)
allocate(tmpFloat(nTime,nSpace))
iret = nf90_get_var(ncid, varid, tmpFloat)
do tt=1,nTime
   do ss=1,nSpace
      lastObsStr(ss)%lastObsModelDischarge(tt) = tmpFloat(tt,ss)
   end do
end do
deallocate(tmpFloat)

!discharge _quality read var
iret = nf90_inq_varid(ncid, "discharge_quality", varid)
allocate(qualityInt2(nTime,nSpace))
iret = nf90_get_var(ncid, varid, qualityInt2)
do tt=1,nTime
   do ss=1,nSpace
      lastObsStr(ss)%lastObsQuality(tt) = qualityInt2(tt,ss)/real(100)
   end do
end do
deallocate(qualityInt2)

iret = nf90_inq_varid(ncid, "nudge", varid)
if(iret .eq. nf90_noerr) then   
   iret = nf90_get_var(ncid, varid, g_nudge)
else 
   g_nudge=0.0000000000
end if

!! close
iret= nf90_close(ncid)

print*,'Ndg: end read_nudging_last_obs'
flush(6)

end subroutine read_nudging_last_obs


!===================================================================================================
! Subroutine Name: 
!   subroutine read_network_reexpression
! Author(s)/Contact(s): 
!   James L McCreight <jamesmcc><ucar><edu>
! Abstract: 
!   Read the three netcdf files which allow the stream network to be traversed with 
!   indexing.
! History Log: 
!   7/23/15 -Created, JLM.
! Usage:
! Parameters: 
! Input Files: 
! Output Files: 
! Condition codes: 
! User controllable options: None. 
! Notes:

subroutine read_network_reexpression( &
                           file,      & ! file with dims of the stream ntwk
                           upGo,      & ! where each ind came from, upstream
                           upStart,   & ! where each ind's upstream links start in upGo
                           upEnd,     & ! where each ind's upstream links end   in upGo
                           downGo,    & ! where each ind goes, downstream
                           downStart, & ! where each ind's downstream links start in downGo
                           downEnd    ) ! where each ind's downstream links end   in downGo

implicit none

character(len=*), intent(in) :: file
integer*4, dimension(:), intent(out) :: upGo      
integer*4, dimension(:), intent(out) :: upStart   
integer*4, dimension(:), intent(out) :: upEnd     
integer*4, dimension(:), intent(out) :: downGo    
integer*4, dimension(:), intent(out) :: downStart 
integer*4, dimension(:), intent(out) :: downEnd

character(len=25) :: subroutineName
integer :: iRet, ncid, errStatus
print*,"Ndg: start read_network_reexpression"
flush(6)

subroutineName = 'read_network_reexpression'

iRet = nf90_open(trim(file), nf90_nowrite, ncid)
if (iRet /= nf90_noerr) then
   write(*,'("read_network_reexpression: Problem opening: ''", A, "''")') trim(file)
   call hydro_stop(subroutineName // ": Problem opening file: " // file)
endif

call get_1d_netcdf_int4(ncid, 'upGo',      upGo,      subroutineName, .TRUE., errStatus)
call get_1d_netcdf_int4(ncid, 'upStart',   upStart,   subroutineName, .TRUE., errStatus)
call get_1d_netcdf_int4(ncid, 'upEnd',     upEnd,     subroutineName, .TRUE., errStatus)
call get_1d_netcdf_int4(ncid, 'downGo',    downGo,    subroutineName, .TRUE., errStatus)
call get_1d_netcdf_int4(ncid, 'downStart', downStart, subroutineName, .TRUE., errStatus)
call get_1d_netcdf_int4(ncid, 'downEnd',   downEnd,   subroutineName, .TRUE., errStatus)

iRet = nf90_close(ncId)
if (iRet /= nf90_noerr) then
   write(*,'("read_network_reexpression: Problem closing: ''", A, "''")') trim(file)
   call hydro_stop(subroutineName // ": Problem closing file: " // file)
end if

print*,"Ndg: finish read_network_reexpression"
flush(6)

end subroutine read_network_reexpression

!===================================================================================================
! Subroutine Name: 
!   subroutine output_chan_connectivity
! Author(s)/Contact(s): 
!   James L McCreight <jamesmcc><ucar><edu>
! Abstract: 
!   For gridded channel routing, write the channel connectivity to a netcdf file 
!   so channel analyses can be performed offline. Do it here so any changes to the 
!   topology calculation are maintained without external code.
! History Log: 
!   5/27/15 -Created, JLM.
! Usage:
! Parameters: 
! Input Files: 
! Output Files: 
! Condition codes: 
! User controllable options:
! Notes  : 
!   One day it might be worth writing code to read the files output by this code, 
!   depending on the time spent on the calculations when restarting a domain:
!   is recalculation faster than reading in the file written by this routine?   

subroutine output_chan_connectivity( &
     inCHLAT,     inCHLON,             &   !! Channel grid lat, lon.
     inCHANLEN,                        &   !! The distance between channel grid centers in m.
     inFROM_NODE, inTO_NODE,           &   !! Index of a given cell and the index which it flows to.
     inCHANXI,    inCHANYJ,            &   !! Index on fine/routing grid of grid cells.
     inTYPEL,     inLAKENODE           &   !! Lake type? and node? indications.
)


use module_mpp_land

implicit none
!     NetCDF-3.
!
! netcdf version 3 fortran interface:
!

!
! external netcdf data types:
!
      integer nf_byte
      integer nf_int1
      integer nf_char
      integer nf_short
      integer nf_int2
      integer nf_int
      integer nf_float
      integer nf_real
      integer nf_double

      parameter (nf_byte = 1)
      parameter (nf_int1 = nf_byte)
      parameter (nf_char = 2)
      parameter (nf_short = 3)
      parameter (nf_int2 = nf_short)
      parameter (nf_int = 4)
      parameter (nf_float = 5)
      parameter (nf_real = nf_float)
      parameter (nf_double = 6)

!
! default fill values:
!
      integer           nf_fill_byte
      integer           nf_fill_int1
      integer           nf_fill_char
      integer           nf_fill_short
      integer           nf_fill_int2
      integer           nf_fill_int
      real              nf_fill_float
      real              nf_fill_real
      doubleprecision   nf_fill_double

      parameter (nf_fill_byte = -127)
      parameter (nf_fill_int1 = nf_fill_byte)
      parameter (nf_fill_char = 0)
      parameter (nf_fill_short = -32767)
      parameter (nf_fill_int2 = nf_fill_short)
      parameter (nf_fill_int = -2147483647)
      parameter (nf_fill_float = 9.9692099683868690e+36)
      parameter (nf_fill_real = nf_fill_float)
      parameter (nf_fill_double = 9.9692099683868690d+36)

!
! mode flags for opening and creating a netcdf dataset:
!
      integer nf_nowrite
      integer nf_write
      integer nf_clobber
      integer nf_noclobber
      integer nf_fill
      integer nf_nofill
      integer nf_lock
      integer nf_share
      integer nf_64bit_offset
      integer nf_sizehint_default
      integer nf_align_chunk
      integer nf_format_classic
      integer nf_format_64bit
      integer nf_diskless
      integer nf_mmap

      parameter (nf_nowrite = 0)
      parameter (nf_write = 1)
      parameter (nf_clobber = 0)
      parameter (nf_noclobber = 4)
      parameter (nf_fill = 0)
      parameter (nf_nofill = 256)
      parameter (nf_lock = 1024)
      parameter (nf_share = 2048)
      parameter (nf_64bit_offset = 512)
      parameter (nf_sizehint_default = 0)
      parameter (nf_align_chunk = -1)
      parameter (nf_format_classic = 1)
      parameter (nf_format_64bit = 2)
      parameter (nf_diskless = 8)
      parameter (nf_mmap = 16)

!
! size argument for defining an unlimited dimension:
!
      integer nf_unlimited
      parameter (nf_unlimited = 0)

!
! global attribute id:
!
      integer nf_global
      parameter (nf_global = 0)

!
! implementation limits:
!
      integer nf_max_dims
      integer nf_max_attrs
      integer nf_max_vars
      integer nf_max_name
      integer nf_max_var_dims

      parameter (nf_max_dims = 1024)
      parameter (nf_max_attrs = 8192)
      parameter (nf_max_vars = 8192)
      parameter (nf_max_name = 256)
      parameter (nf_max_var_dims = nf_max_dims)

!
! error codes:
!
      integer nf_noerr
      integer nf_ebadid
      integer nf_eexist
      integer nf_einval
      integer nf_eperm
      integer nf_enotindefine
      integer nf_eindefine
      integer nf_einvalcoords
      integer nf_emaxdims
      integer nf_enameinuse
      integer nf_enotatt
      integer nf_emaxatts
      integer nf_ebadtype
      integer nf_ebaddim
      integer nf_eunlimpos
      integer nf_emaxvars
      integer nf_enotvar
      integer nf_eglobal
      integer nf_enotnc
      integer nf_ests
      integer nf_emaxname
      integer nf_eunlimit
      integer nf_enorecvars
      integer nf_echar
      integer nf_eedge
      integer nf_estride
      integer nf_ebadname
      integer nf_erange
      integer nf_enomem
      integer nf_evarsize
      integer nf_edimsize
      integer nf_etrunc

      parameter (nf_noerr = 0)
      parameter (nf_ebadid = -33)
      parameter (nf_eexist = -35)
      parameter (nf_einval = -36)
      parameter (nf_eperm = -37)
      parameter (nf_enotindefine = -38)
      parameter (nf_eindefine = -39)
      parameter (nf_einvalcoords = -40)
      parameter (nf_emaxdims = -41)
      parameter (nf_enameinuse = -42)
      parameter (nf_enotatt = -43)
      parameter (nf_emaxatts = -44)
      parameter (nf_ebadtype = -45)
      parameter (nf_ebaddim = -46)
      parameter (nf_eunlimpos = -47)
      parameter (nf_emaxvars = -48)
      parameter (nf_enotvar = -49)
      parameter (nf_eglobal = -50)
      parameter (nf_enotnc = -51)
      parameter (nf_ests = -52)
      parameter (nf_emaxname = -53)
      parameter (nf_eunlimit = -54)
      parameter (nf_enorecvars = -55)
      parameter (nf_echar = -56)
      parameter (nf_eedge = -57)
      parameter (nf_estride = -58)
      parameter (nf_ebadname = -59)
      parameter (nf_erange = -60)
      parameter (nf_enomem = -61)
      parameter (nf_evarsize = -62)
      parameter (nf_edimsize = -63)
      parameter (nf_etrunc = -64)
!
! error handling modes:
!
      integer  nf_fatal
      integer nf_verbose

      parameter (nf_fatal = 1)
      parameter (nf_verbose = 2)

!
! miscellaneous routines:
!
      character*80   nf_inq_libvers
      external       nf_inq_libvers

      character*80   nf_strerror
!                         (integer             ncerr)
      external       nf_strerror

      logical        nf_issyserr
!                         (integer             ncerr)
      external       nf_issyserr

!
! control routines:
!
      integer         nf_inq_base_pe
!                         (integer             ncid,
!                          integer             pe)
      external        nf_inq_base_pe

      integer         nf_set_base_pe
!                         (integer             ncid,
!                          integer             pe)
      external        nf_set_base_pe

      integer         nf_create
!                         (character*(*)       path,
!                          integer             cmode,
!                          integer             ncid)
      external        nf_create

      integer         nf__create
!                         (character*(*)       path,
!                          integer             cmode,
!                          integer             initialsz,
!                          integer             chunksizehint,
!                          integer             ncid)
      external        nf__create

      integer         nf__create_mp
!                         (character*(*)       path,
!                          integer             cmode,
!                          integer             initialsz,
!                          integer             basepe,
!                          integer             chunksizehint,
!                          integer             ncid)
      external        nf__create_mp

      integer         nf_open
!                         (character*(*)       path,
!                          integer             mode,
!                          integer             ncid)
      external        nf_open

      integer         nf__open
!                         (character*(*)       path,
!                          integer             mode,
!                          integer             chunksizehint,
!                          integer             ncid)
      external        nf__open

      integer         nf__open_mp
!                         (character*(*)       path,
!                          integer             mode,
!                          integer             basepe,
!                          integer             chunksizehint,
!                          integer             ncid)
      external        nf__open_mp

      integer         nf_set_fill
!                         (integer             ncid,
!                          integer             fillmode,
!                          integer             old_mode)
      external        nf_set_fill

      integer         nf_set_default_format
!                          (integer             format,
!                          integer             old_format)
      external        nf_set_default_format

      integer         nf_redef
!                         (integer             ncid)
      external        nf_redef

      integer         nf_enddef
!                         (integer             ncid)
      external        nf_enddef

      integer         nf__enddef
!                         (integer             ncid,
!                          integer             h_minfree,
!                          integer             v_align,
!                          integer             v_minfree,
!                          integer             r_align)
      external        nf__enddef

      integer         nf_sync
!                         (integer             ncid)
      external        nf_sync

      integer         nf_abort
!                         (integer             ncid)
      external        nf_abort

      integer         nf_close
!                         (integer             ncid)
      external        nf_close

      integer         nf_delete
!                         (character*(*)       ncid)
      external        nf_delete

!
! general inquiry routines:
!

      integer         nf_inq
!                         (integer             ncid,
!                          integer             ndims,
!                          integer             nvars,
!                          integer             ngatts,
!                          integer             unlimdimid)
      external        nf_inq

! new inquire path

      integer nf_inq_path
      external nf_inq_path

      integer         nf_inq_ndims
!                         (integer             ncid,
!                          integer             ndims)
      external        nf_inq_ndims

      integer         nf_inq_nvars
!                         (integer             ncid,
!                          integer             nvars)
      external        nf_inq_nvars

      integer         nf_inq_natts
!                         (integer             ncid,
!                          integer             ngatts)
      external        nf_inq_natts

      integer         nf_inq_unlimdim
!                         (integer             ncid,
!                          integer             unlimdimid)
      external        nf_inq_unlimdim

      integer         nf_inq_format
!                         (integer             ncid,
!                          integer             format)
      external        nf_inq_format

!
! dimension routines:
!

      integer         nf_def_dim
!                         (integer             ncid,
!                          character(*)        name,
!                          integer             len,
!                          integer             dimid)
      external        nf_def_dim

      integer         nf_inq_dimid
!                         (integer             ncid,
!                          character(*)        name,
!                          integer             dimid)
      external        nf_inq_dimid

      integer         nf_inq_dim
!                         (integer             ncid,
!                          integer             dimid,
!                          character(*)        name,
!                          integer             len)
      external        nf_inq_dim

      integer         nf_inq_dimname
!                         (integer             ncid,
!                          integer             dimid,
!                          character(*)        name)
      external        nf_inq_dimname

      integer         nf_inq_dimlen
!                         (integer             ncid,
!                          integer             dimid,
!                          integer             len)
      external        nf_inq_dimlen

      integer         nf_rename_dim
!                         (integer             ncid,
!                          integer             dimid,
!                          character(*)        name)
      external        nf_rename_dim

!
! general attribute routines:
!

      integer         nf_inq_att
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             xtype,
!                          integer             len)
      external        nf_inq_att

      integer         nf_inq_attid
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             attnum)
      external        nf_inq_attid

      integer         nf_inq_atttype
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             xtype)
      external        nf_inq_atttype

      integer         nf_inq_attlen
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             len)
      external        nf_inq_attlen

      integer         nf_inq_attname
!                         (integer             ncid,
!                          integer             varid,
!                          integer             attnum,
!                          character(*)        name)
      external        nf_inq_attname

      integer         nf_copy_att
!                         (integer             ncid_in,
!                          integer             varid_in,
!                          character(*)        name,
!                          integer             ncid_out,
!                          integer             varid_out)
      external        nf_copy_att

      integer         nf_rename_att
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        curname,
!                          character(*)        newname)
      external        nf_rename_att

      integer         nf_del_att
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name)
      external        nf_del_att

!
! attribute put/get routines:
!

      integer         nf_put_att_text
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             len,
!                          character(*)        text)
      external        nf_put_att_text

      integer         nf_get_att_text
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          character(*)        text)
      external        nf_get_att_text

      integer         nf_put_att_int1
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             xtype,
!                          integer             len,
!                          nf_int1_t           i1vals(1))
      external        nf_put_att_int1

      integer         nf_get_att_int1
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          nf_int1_t           i1vals(1))
      external        nf_get_att_int1

      integer         nf_put_att_int2
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             xtype,
!                          integer             len,
!                          nf_int2_t           i2vals(1))
      external        nf_put_att_int2

      integer         nf_get_att_int2
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          nf_int2_t           i2vals(1))
      external        nf_get_att_int2

      integer         nf_put_att_int
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             xtype,
!                          integer             len,
!                          integer             ivals(1))
      external        nf_put_att_int

      integer         nf_get_att_int
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             ivals(1))
      external        nf_get_att_int

      integer         nf_put_att_real
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             xtype,
!                          integer             len,
!                          real                rvals(1))
      external        nf_put_att_real

      integer         nf_get_att_real
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          real                rvals(1))
      external        nf_get_att_real

      integer         nf_put_att_double
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             xtype,
!                          integer             len,
!                          double              dvals(1))
      external        nf_put_att_double

      integer         nf_get_att_double
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          double              dvals(1))
      external        nf_get_att_double

!
! general variable routines:
!

      integer         nf_def_var
!                         (integer             ncid,
!                          character(*)        name,
!                          integer             datatype,
!                          integer             ndims,
!                          integer             dimids(1),
!                          integer             varid)
      external        nf_def_var

      integer         nf_inq_var
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name,
!                          integer             datatype,
!                          integer             ndims,
!                          integer             dimids(1),
!                          integer             natts)
      external        nf_inq_var

      integer         nf_inq_varid
!                         (integer             ncid,
!                          character(*)        name,
!                          integer             varid)
      external        nf_inq_varid

      integer         nf_inq_varname
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name)
      external        nf_inq_varname

      integer         nf_inq_vartype
!                         (integer             ncid,
!                          integer             varid,
!                          integer             xtype)
      external        nf_inq_vartype

      integer         nf_inq_varndims
!                         (integer             ncid,
!                          integer             varid,
!                          integer             ndims)
      external        nf_inq_varndims

      integer         nf_inq_vardimid
!                         (integer             ncid,
!                          integer             varid,
!                          integer             dimids(1))
      external        nf_inq_vardimid

      integer         nf_inq_varnatts
!                         (integer             ncid,
!                          integer             varid,
!                          integer             natts)
      external        nf_inq_varnatts

      integer         nf_rename_var
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        name)
      external        nf_rename_var

      integer         nf_copy_var
!                         (integer             ncid_in,
!                          integer             varid,
!                          integer             ncid_out)
      external        nf_copy_var

!
! entire variable put/get routines:
!

      integer         nf_put_var_text
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        text)
      external        nf_put_var_text

      integer         nf_get_var_text
!                         (integer             ncid,
!                          integer             varid,
!                          character(*)        text)
      external        nf_get_var_text

      integer         nf_put_var_int1
!                         (integer             ncid,
!                          integer             varid,
!                          nf_int1_t           i1vals(1))
      external        nf_put_var_int1

      integer         nf_get_var_int1
!                         (integer             ncid,
!                          integer             varid,
!                          nf_int1_t           i1vals(1))
      external        nf_get_var_int1

      integer         nf_put_var_int2
!                         (integer             ncid,
!                          integer             varid,
!                          nf_int2_t           i2vals(1))
      external        nf_put_var_int2

      integer         nf_get_var_int2
!                         (integer             ncid,
!                          integer             varid,
!                          nf_int2_t           i2vals(1))
      external        nf_get_var_int2

      integer         nf_put_var_int
!                         (integer             ncid,
!                          integer             varid,
!                          integer             ivals(1))
      external        nf_put_var_int

      integer         nf_get_var_int
!                         (integer             ncid,
!                          integer             varid,
!                          integer             ivals(1))
      external        nf_get_var_int

      integer         nf_put_var_real
!                         (integer             ncid,
!                          integer             varid,
!                          real                rvals(1))
      external        nf_put_var_real

      integer         nf_get_var_real
!                         (integer             ncid,
!                          integer             varid,
!                          real                rvals(1))
      external        nf_get_var_real

      integer         nf_put_var_double
!                         (integer             ncid,
!                          integer             varid,
!                          doubleprecision     dvals(1))
      external        nf_put_var_double

      integer         nf_get_var_double
!                         (integer             ncid,
!                          integer             varid,
!                          doubleprecision     dvals(1))
      external        nf_get_var_double

!
! single variable put/get routines:
!

      integer         nf_put_var1_text
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          character*1         text)
      external        nf_put_var1_text

      integer         nf_get_var1_text
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          character*1         text)
      external        nf_get_var1_text

      integer         nf_put_var1_int1
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          nf_int1_t           i1val)
      external        nf_put_var1_int1

      integer         nf_get_var1_int1
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          nf_int1_t           i1val)
      external        nf_get_var1_int1

      integer         nf_put_var1_int2
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          nf_int2_t           i2val)
      external        nf_put_var1_int2

      integer         nf_get_var1_int2
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          nf_int2_t           i2val)
      external        nf_get_var1_int2

      integer         nf_put_var1_int
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          integer             ival)
      external        nf_put_var1_int

      integer         nf_get_var1_int
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          integer             ival)
      external        nf_get_var1_int

      integer         nf_put_var1_real
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          real                rval)
      external        nf_put_var1_real

      integer         nf_get_var1_real
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          real                rval)
      external        nf_get_var1_real

      integer         nf_put_var1_double
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          doubleprecision     dval)
      external        nf_put_var1_double

      integer         nf_get_var1_double
!                         (integer             ncid,
!                          integer             varid,
!                          integer             index(1),
!                          doubleprecision     dval)
      external        nf_get_var1_double

!
! variable array put/get routines:
!

      integer         nf_put_vara_text
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          character(*)        text)
      external        nf_put_vara_text

      integer         nf_get_vara_text
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          character(*)        text)
      external        nf_get_vara_text

      integer         nf_put_vara_int1
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          nf_int1_t           i1vals(1))
      external        nf_put_vara_int1

      integer         nf_get_vara_int1
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          nf_int1_t           i1vals(1))
      external        nf_get_vara_int1

      integer         nf_put_vara_int2
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          nf_int2_t           i2vals(1))
      external        nf_put_vara_int2

      integer         nf_get_vara_int2
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          nf_int2_t           i2vals(1))
      external        nf_get_vara_int2

      integer         nf_put_vara_int
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             ivals(1))
      external        nf_put_vara_int

      integer         nf_get_vara_int
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             ivals(1))
      external        nf_get_vara_int

      integer         nf_put_vara_real
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          real                rvals(1))
      external        nf_put_vara_real

      integer         nf_get_vara_real
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          real                rvals(1))
      external        nf_get_vara_real

      integer         nf_put_vara_double
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          doubleprecision     dvals(1))
      external        nf_put_vara_double

      integer         nf_get_vara_double
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          doubleprecision     dvals(1))
      external        nf_get_vara_double

!
! strided variable put/get routines:
!

      integer         nf_put_vars_text
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          character(*)        text)
      external        nf_put_vars_text

      integer         nf_get_vars_text
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          character(*)        text)
      external        nf_get_vars_text

      integer         nf_put_vars_int1
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          nf_int1_t           i1vals(1))
      external        nf_put_vars_int1

      integer         nf_get_vars_int1
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          nf_int1_t           i1vals(1))
      external        nf_get_vars_int1

      integer         nf_put_vars_int2
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          nf_int2_t           i2vals(1))
      external        nf_put_vars_int2

      integer         nf_get_vars_int2
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          nf_int2_t           i2vals(1))
      external        nf_get_vars_int2

      integer         nf_put_vars_int
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             ivals(1))
      external        nf_put_vars_int

      integer         nf_get_vars_int
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             ivals(1))
      external        nf_get_vars_int

      integer         nf_put_vars_real
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          real                rvals(1))
      external        nf_put_vars_real

      integer         nf_get_vars_real
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          real                rvals(1))
      external        nf_get_vars_real

      integer         nf_put_vars_double
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          doubleprecision     dvals(1))
      external        nf_put_vars_double

      integer         nf_get_vars_double
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          doubleprecision     dvals(1))
      external        nf_get_vars_double

!
! mapped variable put/get routines:
!

      integer         nf_put_varm_text
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          character(*)        text)
      external        nf_put_varm_text

      integer         nf_get_varm_text
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          character(*)        text)
      external        nf_get_varm_text

      integer         nf_put_varm_int1
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          nf_int1_t           i1vals(1))
      external        nf_put_varm_int1

      integer         nf_get_varm_int1
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          nf_int1_t           i1vals(1))
      external        nf_get_varm_int1

      integer         nf_put_varm_int2
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          nf_int2_t           i2vals(1))
      external        nf_put_varm_int2

      integer         nf_get_varm_int2
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          nf_int2_t           i2vals(1))
      external        nf_get_varm_int2

      integer         nf_put_varm_int
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          integer             ivals(1))
      external        nf_put_varm_int

      integer         nf_get_varm_int
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          integer             ivals(1))
      external        nf_get_varm_int

      integer         nf_put_varm_real
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          real                rvals(1))
      external        nf_put_varm_real

      integer         nf_get_varm_real
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          real                rvals(1))
      external        nf_get_varm_real

      integer         nf_put_varm_double
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          doubleprecision     dvals(1))
      external        nf_put_varm_double

      integer         nf_get_varm_double
!                         (integer             ncid,
!                          integer             varid,
!                          integer             start(1),
!                          integer             count(1),
!                          integer             stride(1),
!                          integer             imap(1),
!                          doubleprecision     dvals(1))
      external        nf_get_varm_double


!     NetCDF-4.
!     This is part of netCDF-4. Copyright 2006, UCAR, See COPYRIGHT
!     file for distribution information.

!     Netcdf version 4 fortran interface.

!     $Id: netcdf4.inc,v 1.28 2010/05/25 13:53:02 ed Exp $

!     New netCDF-4 types.
      integer nf_ubyte
      integer nf_ushort
      integer nf_uint
      integer nf_int64
      integer nf_uint64
      integer nf_string
      integer nf_vlen
      integer nf_opaque
      integer nf_enum
      integer nf_compound

      parameter (nf_ubyte = 7)
      parameter (nf_ushort = 8)
      parameter (nf_uint = 9)
      parameter (nf_int64 = 10)
      parameter (nf_uint64 = 11)
      parameter (nf_string = 12)
      parameter (nf_vlen = 13)
      parameter (nf_opaque = 14)
      parameter (nf_enum = 15)
      parameter (nf_compound = 16)

!     New netCDF-4 fill values.
      integer           nf_fill_ubyte
      integer           nf_fill_ushort
!      real              nf_fill_uint
!      real              nf_fill_int64
!      real              nf_fill_uint64
      parameter (nf_fill_ubyte = 255)
      parameter (nf_fill_ushort = 65535)

!     New constants.
      integer nf_format_netcdf4
      parameter (nf_format_netcdf4 = 3)

      integer nf_format_netcdf4_classic
      parameter (nf_format_netcdf4_classic = 4)

      integer nf_netcdf4
      parameter (nf_netcdf4 = 4096)

      integer nf_classic_model
      parameter (nf_classic_model = 256)

      integer nf_chunk_seq
      parameter (nf_chunk_seq = 0)
      integer nf_chunk_sub
      parameter (nf_chunk_sub = 1)
      integer nf_chunk_sizes
      parameter (nf_chunk_sizes = 2)

      integer nf_endian_native
      parameter (nf_endian_native = 0)
      integer nf_endian_little
      parameter (nf_endian_little = 1)
      integer nf_endian_big
      parameter (nf_endian_big = 2)

!     For NF_DEF_VAR_CHUNKING
      integer nf_chunked
      parameter (nf_chunked = 0)
      integer nf_contiguous
      parameter (nf_contiguous = 1)

!     For NF_DEF_VAR_FLETCHER32
      integer nf_nochecksum
      parameter (nf_nochecksum = 0)
      integer nf_fletcher32
      parameter (nf_fletcher32 = 1)

!     For NF_DEF_VAR_DEFLATE
      integer nf_noshuffle
      parameter (nf_noshuffle = 0)
      integer nf_shuffle
      parameter (nf_shuffle = 1)

!     For NF_DEF_VAR_SZIP
      integer nf_szip_ec_option_mask
      parameter (nf_szip_ec_option_mask = 4)
      integer nf_szip_nn_option_mask
      parameter (nf_szip_nn_option_mask = 32)

!     For parallel I/O.
      integer nf_mpiio      
      parameter (nf_mpiio = 8192)
      integer nf_mpiposix
      parameter (nf_mpiposix = 16384)
      integer nf_pnetcdf
      parameter (nf_pnetcdf = 32768)

!     For NF_VAR_PAR_ACCESS.
      integer nf_independent
      parameter (nf_independent = 0)
      integer nf_collective
      parameter (nf_collective = 1)

!     New error codes.
      integer nf_ehdferr        ! Error at HDF5 layer. 
      parameter (nf_ehdferr = -101)
      integer nf_ecantread      ! Can't read. 
      parameter (nf_ecantread = -102)
      integer nf_ecantwrite     ! Can't write. 
      parameter (nf_ecantwrite = -103)
      integer nf_ecantcreate    ! Can't create. 
      parameter (nf_ecantcreate = -104)
      integer nf_efilemeta      ! Problem with file metadata. 
      parameter (nf_efilemeta = -105)
      integer nf_edimmeta       ! Problem with dimension metadata. 
      parameter (nf_edimmeta = -106)
      integer nf_eattmeta       ! Problem with attribute metadata. 
      parameter (nf_eattmeta = -107)
      integer nf_evarmeta       ! Problem with variable metadata. 
      parameter (nf_evarmeta = -108)
      integer nf_enocompound    ! Not a compound type. 
      parameter (nf_enocompound = -109)
      integer nf_eattexists     ! Attribute already exists. 
      parameter (nf_eattexists = -110)
      integer nf_enotnc4        ! Attempting netcdf-4 operation on netcdf-3 file.   
      parameter (nf_enotnc4 = -111)
      integer nf_estrictnc3     ! Attempting netcdf-4 operation on strict nc3 netcdf-4 file.   
      parameter (nf_estrictnc3 = -112)
      integer nf_enotnc3        ! Attempting netcdf-3 operation on netcdf-4 file.   
      parameter (nf_enotnc3 = -113)
      integer nf_enopar         ! Parallel operation on file opened for non-parallel access.   
      parameter (nf_enopar = -114)
      integer nf_eparinit       ! Error initializing for parallel access.   
      parameter (nf_eparinit = -115)
      integer nf_ebadgrpid      ! Bad group ID.   
      parameter (nf_ebadgrpid = -116)
      integer nf_ebadtypid      ! Bad type ID.   
      parameter (nf_ebadtypid = -117)
      integer nf_etypdefined    ! Type has already been defined and may not be edited. 
      parameter (nf_etypdefined = -118)
      integer nf_ebadfield      ! Bad field ID.   
      parameter (nf_ebadfield = -119)
      integer nf_ebadclass      ! Bad class.   
      parameter (nf_ebadclass = -120)
      integer nf_emaptype       ! Mapped access for atomic types only.   
      parameter (nf_emaptype = -121)
      integer nf_elatefill      ! Attempt to define fill value when data already exists. 
      parameter (nf_elatefill = -122)
      integer nf_elatedef       ! Attempt to define var properties, like deflate, after enddef. 
      parameter (nf_elatedef = -123)
      integer nf_edimscale      ! Probem with HDF5 dimscales. 
      parameter (nf_edimscale = -124)
      integer nf_enogrp       ! No group found.
      parameter (nf_enogrp = -125)


!     New functions.

!     Parallel I/O.
      integer nf_create_par
      external nf_create_par

      integer nf_open_par
      external nf_open_par

      integer nf_var_par_access
      external nf_var_par_access

!     Functions to handle groups.
      integer nf_inq_ncid
      external nf_inq_ncid

      integer nf_inq_grps
      external nf_inq_grps

      integer nf_inq_grpname
      external nf_inq_grpname

      integer nf_inq_grpname_full
      external nf_inq_grpname_full

      integer nf_inq_grpname_len
      external nf_inq_grpname_len

      integer nf_inq_grp_parent
      external nf_inq_grp_parent

      integer nf_inq_grp_ncid
      external nf_inq_grp_ncid

      integer nf_inq_grp_full_ncid
      external nf_inq_grp_full_ncid

      integer nf_inq_varids
      external nf_inq_varids

      integer nf_inq_dimids
      external nf_inq_dimids

      integer nf_def_grp
      external nf_def_grp

!     New rename grp function

      integer nf_rename_grp
      external nf_rename_grp

!     New options for netCDF variables.
      integer nf_def_var_deflate
      external nf_def_var_deflate

      integer nf_inq_var_deflate
      external nf_inq_var_deflate

      integer nf_def_var_fletcher32
      external nf_def_var_fletcher32

      integer nf_inq_var_fletcher32
      external nf_inq_var_fletcher32

      integer nf_def_var_chunking
      external nf_def_var_chunking

      integer nf_inq_var_chunking
      external nf_inq_var_chunking

      integer nf_def_var_fill
      external nf_def_var_fill

      integer nf_inq_var_fill
      external nf_inq_var_fill

      integer nf_def_var_endian
      external nf_def_var_endian

      integer nf_inq_var_endian
      external nf_inq_var_endian

!     User defined types.
      integer nf_inq_typeids
      external nf_inq_typeids

      integer nf_inq_typeid
      external nf_inq_typeid

      integer nf_inq_type
      external nf_inq_type

      integer nf_inq_user_type
      external nf_inq_user_type

!     User defined types - compound types.
      integer nf_def_compound
      external nf_def_compound

      integer nf_insert_compound
      external nf_insert_compound

      integer nf_insert_array_compound
      external nf_insert_array_compound

      integer nf_inq_compound
      external nf_inq_compound

      integer nf_inq_compound_name
      external nf_inq_compound_name

      integer nf_inq_compound_size
      external nf_inq_compound_size

      integer nf_inq_compound_nfields
      external nf_inq_compound_nfields

      integer nf_inq_compound_field
      external nf_inq_compound_field

      integer nf_inq_compound_fieldname
      external nf_inq_compound_fieldname

      integer nf_inq_compound_fieldindex
      external nf_inq_compound_fieldindex

      integer nf_inq_compound_fieldoffset
      external nf_inq_compound_fieldoffset

      integer nf_inq_compound_fieldtype
      external nf_inq_compound_fieldtype

      integer nf_inq_compound_fieldndims
      external nf_inq_compound_fieldndims

      integer nf_inq_compound_fielddim_sizes
      external nf_inq_compound_fielddim_sizes

!     User defined types - variable length arrays.
      integer nf_def_vlen
      external nf_def_vlen

      integer nf_inq_vlen
      external nf_inq_vlen

      integer nf_free_vlen
      external nf_free_vlen

!     User defined types - enums.
      integer nf_def_enum
      external nf_def_enum

      integer nf_insert_enum
      external nf_insert_enum

      integer nf_inq_enum
      external nf_inq_enum

      integer nf_inq_enum_member
      external nf_inq_enum_member

      integer nf_inq_enum_ident
      external nf_inq_enum_ident

!     User defined types - opaque.
      integer nf_def_opaque
      external nf_def_opaque

      integer nf_inq_opaque
      external nf_inq_opaque

!     Write and read attributes of any type, including user defined
!     types.
      integer nf_put_att
      external nf_put_att
      integer nf_get_att
      external nf_get_att

!     Write and read variables of any type, including user defined
!     types.
      integer nf_put_var
      external nf_put_var
      integer nf_put_var1
      external nf_put_var1
      integer nf_put_vara
      external nf_put_vara
      integer nf_put_vars
      external nf_put_vars
      integer nf_get_var
      external nf_get_var
      integer nf_get_var1
      external nf_get_var1
      integer nf_get_vara
      external nf_get_vara
      integer nf_get_vars
      external nf_get_vars

!     64-bit int functions.
      integer nf_put_var1_int64
      external nf_put_var1_int64
      integer nf_put_vara_int64
      external nf_put_vara_int64
      integer nf_put_vars_int64
      external nf_put_vars_int64
      integer nf_put_varm_int64
      external nf_put_varm_int64
      integer nf_put_var_int64
      external nf_put_var_int64
      integer nf_get_var1_int64
      external nf_get_var1_int64
      integer nf_get_vara_int64
      external nf_get_vara_int64
      integer nf_get_vars_int64
      external nf_get_vars_int64
      integer nf_get_varm_int64
      external nf_get_varm_int64
      integer nf_get_var_int64
      external nf_get_var_int64

!     For helping F77 users with VLENs.
      integer nf_get_vlen_element
      external nf_get_vlen_element
      integer nf_put_vlen_element
      external nf_put_vlen_element

!     For dealing with file level chunk cache.
      integer nf_set_chunk_cache
      external nf_set_chunk_cache
      integer nf_get_chunk_cache
      external nf_get_chunk_cache

!     For dealing with per variable chunk cache.
      integer nf_set_var_chunk_cache
      external nf_set_var_chunk_cache
      integer nf_get_var_chunk_cache
      external nf_get_var_chunk_cache

!     NetCDF-2.
!ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
! begin netcdf 2.4 backward compatibility:
!

!      
! functions in the fortran interface
!
      integer nccre
      integer ncopn
      integer ncddef
      integer ncdid
      integer ncvdef
      integer ncvid
      integer nctlen
      integer ncsfil

      external nccre
      external ncopn
      external ncddef
      external ncdid
      external ncvdef
      external ncvid
      external nctlen
      external ncsfil


      integer ncrdwr
      integer nccreat
      integer ncexcl
      integer ncindef
      integer ncnsync
      integer nchsync
      integer ncndirty
      integer nchdirty
      integer nclink
      integer ncnowrit
      integer ncwrite
      integer ncclob
      integer ncnoclob
      integer ncglobal
      integer ncfill
      integer ncnofill
      integer maxncop
      integer maxncdim
      integer maxncatt
      integer maxncvar
      integer maxncnam
      integer maxvdims
      integer ncnoerr
      integer ncebadid
      integer ncenfile
      integer nceexist
      integer nceinval
      integer nceperm
      integer ncenotin
      integer nceindef
      integer ncecoord
      integer ncemaxds
      integer ncename
      integer ncenoatt
      integer ncemaxat
      integer ncebadty
      integer ncebadd
      integer ncests
      integer nceunlim
      integer ncemaxvs
      integer ncenotvr
      integer nceglob
      integer ncenotnc
      integer ncfoobar
      integer ncsyserr
      integer ncfatal
      integer ncverbos
      integer ncentool


!
! netcdf data types:
!
      integer ncbyte
      integer ncchar
      integer ncshort
      integer nclong
      integer ncfloat
      integer ncdouble

      parameter(ncbyte = 1)
      parameter(ncchar = 2)
      parameter(ncshort = 3)
      parameter(nclong = 4)
      parameter(ncfloat = 5)
      parameter(ncdouble = 6)

!     
!     masks for the struct nc flag field; passed in as 'mode' arg to
!     nccreate and ncopen.
!     

!     read/write, 0 => readonly 
      parameter(ncrdwr = 1)
!     in create phase, cleared by ncendef 
      parameter(nccreat = 2)
!     on create destroy existing file 
      parameter(ncexcl = 4)
!     in define mode, cleared by ncendef 
      parameter(ncindef = 8)
!     synchronise numrecs on change (x'10')
      parameter(ncnsync = 16)
!     synchronise whole header on change (x'20')
      parameter(nchsync = 32)
!     numrecs has changed (x'40')
      parameter(ncndirty = 64)  
!     header info has changed (x'80')
      parameter(nchdirty = 128)
!     prefill vars on endef and increase of record, the default behavior
      parameter(ncfill = 0)
!     do not fill vars on endef and increase of record (x'100')
      parameter(ncnofill = 256)
!     isa link (x'8000')
      parameter(nclink = 32768)

!     
!     'mode' arguments for nccreate and ncopen
!     
      parameter(ncnowrit = 0)
      parameter(ncwrite = ncrdwr)
      parameter(ncclob = nf_clobber)
      parameter(ncnoclob = nf_noclobber)

!     
!     'size' argument to ncdimdef for an unlimited dimension
!     
      integer ncunlim
      parameter(ncunlim = 0)

!     
!     attribute id to put/get a global attribute
!     
      parameter(ncglobal  = 0)

!     
!     advisory maximums:
!     
      parameter(maxncop = 64)
      parameter(maxncdim = 1024)
      parameter(maxncatt = 8192)
      parameter(maxncvar = 8192)
!     not enforced 
      parameter(maxncnam = 256)
      parameter(maxvdims = maxncdim)

!     
!     global netcdf error status variable
!     initialized in error.c
!     

!     no error 
      parameter(ncnoerr = nf_noerr)
!     not a netcdf id 
      parameter(ncebadid = nf_ebadid)
!     too many netcdfs open 
      parameter(ncenfile = -31)   ! nc_syserr
!     netcdf file exists && ncnoclob
      parameter(nceexist = nf_eexist)
!     invalid argument 
      parameter(nceinval = nf_einval)
!     write to read only 
      parameter(nceperm = nf_eperm)
!     operation not allowed in data mode 
      parameter(ncenotin = nf_enotindefine )   
!     operation not allowed in define mode 
      parameter(nceindef = nf_eindefine)   
!     coordinates out of domain 
      parameter(ncecoord = nf_einvalcoords)
!     maxncdims exceeded 
      parameter(ncemaxds = nf_emaxdims)
!     string match to name in use 
      parameter(ncename = nf_enameinuse)   
!     attribute not found 
      parameter(ncenoatt = nf_enotatt)
!     maxncattrs exceeded 
      parameter(ncemaxat = nf_emaxatts)
!     not a netcdf data type 
      parameter(ncebadty = nf_ebadtype)
!     invalid dimension id 
      parameter(ncebadd = nf_ebaddim)
!     ncunlimited in the wrong index 
      parameter(nceunlim = nf_eunlimpos)
!     maxncvars exceeded 
      parameter(ncemaxvs = nf_emaxvars)
!     variable not found 
      parameter(ncenotvr = nf_enotvar)
!     action prohibited on ncglobal varid 
      parameter(nceglob = nf_eglobal)
!     not a netcdf file 
      parameter(ncenotnc = nf_enotnc)
      parameter(ncests = nf_ests)
      parameter (ncentool = nf_emaxname) 
      parameter(ncfoobar = 32)
      parameter(ncsyserr = -31)

!     
!     global options variable. used to determine behavior of error handler.
!     initialized in lerror.c
!     
      parameter(ncfatal = 1)
      parameter(ncverbos = 2)

!
!     default fill values.  these must be the same as in the c interface.
!
      integer filbyte
      integer filchar
      integer filshort
      integer fillong
      real filfloat
      doubleprecision fildoub

      parameter (filbyte = -127)
      parameter (filchar = 0)
      parameter (filshort = -32767)
      parameter (fillong = -2147483647)
      parameter (filfloat = 9.9692099683868690e+36)
      parameter (fildoub = 9.9692099683868690e+36)

!! These are the names used in module_HYDRO_io.F: SUBROUTINE READ_CHROUTING1
real,    dimension(:),  intent(in) :: inCHLAT, inCHLON, inCHANLEN
integer, dimension(:),  intent(in) :: inFROM_NODE, inTO_NODE, inCHANXI, inCHANYJ, inTYPEL, inLAKENODE

integer            :: nStreamCells, streamCellDimID
integer            :: iret, projInfo_flag
integer            :: ncid, ncstatic, varid


real               :: long_cm, lat_po, fe, fn
real, dimension(2) :: sp
! JLM this could go to a namelist for flexibility
character(len=256), parameter :: output_flnm = "CHANNEL_CONNECTIVITY.nc"

real,    allocatable, dimension(:) :: CHLAT, CHLON, CHANLEN
integer, allocatable, dimension(:) :: FROM_NODE, TO_NODE, CHANXI, CHANYJ, TYPEL, LAKENODE

!! handle the parallelization in this routine instead of in the main code. 


if(my_id .eq. io_id) then
   allocate( chLat(rt_domain(did)%gnlinks),    chLon(rt_domain(did)%gnlinks)     )
   allocate( chanLen(rt_domain(did)%gnlinks),  from_node(rt_domain(did)%gnlinks) )
   allocate( to_node(rt_domain(did)%gnlinks),  chanXI(rt_domain(did)%gnlinks)    )
   allocate( chanYJ(rt_domain(did)%gnlinks),   typeL(rt_domain(did)%gnlinks)     )
   allocate( lakeNode(rt_domain(did)%gnlinks) )
else 
   allocate(chLat(1),  chLon(1),  chanLen(1), from_node(1), to_node(1) )
   allocate(chanXI(1), chanYJ(1), typeL(1),  lakeNode(1))
end if

call write_chanel_real(inChLat,     rt_domain(did)%map_l2g, &
                       rt_domain(did)%gnlinks, rt_domain(did)%nlinks, chLat)
call write_chanel_real(inChLon,     rt_domain(did)%map_l2g, &
                       rt_domain(did)%gnlinks, rt_domain(did)%nlinks, chLon)
call write_chanel_real(inChanLen,   rt_domain(did)%map_l2g, &
                       rt_domain(did)%gnlinks, rt_domain(did)%nlinks, chanLen)
call write_chanel_int(inFrom_node, rt_domain(did)%map_l2g, &
                       rt_domain(did)%gnlinks, rt_domain(did)%nlinks, from_node)
call write_chanel_int(inTo_node,   rt_domain(did)%map_l2g, &
                       rt_domain(did)%gnlinks, rt_domain(did)%nlinks, to_node)
call write_chanel_int(inChanXI,    rt_domain(did)%map_l2g, &
                       rt_domain(did)%gnlinks, rt_domain(did)%nlinks, chanXI)
call write_chanel_int(inChanYJ,    rt_domain(did)%map_l2g, &
                       rt_domain(did)%gnlinks, rt_domain(did)%nlinks, chanYJ)
call write_chanel_int(inTypeL,     rt_domain(did)%map_l2g, &
                       rt_domain(did)%gnlinks, rt_domain(did)%nlinks, typeL)
call write_chanel_int(inLakeNode,  rt_domain(did)%map_l2g, &
                       rt_domain(did)%gnlinks, rt_domain(did)%nlinks, lakeNode)



if(my_id .eq. io_id) then

   !! jlm: check that all the input variables have the same dimensions? Or will that happen 
   !! by defult when trying to write to ncdf?

   ! Open the  finemesh static files to obtain projection information
   ! jlm: this seems optional, might be nice if output is used for plotting/GIS.
   ! jlm: set did:=1 in nlst_rt
   write(*,'("geo_finegrid_flnm: ''", A, "''")') trim(nlst_rt(did)%geo_finegrid_flnm)

   iret = nf_open(trim(nlst_rt(1)%geo_finegrid_flnm), NF_NOWRITE, ncstatic)
   
   if (iret /= 0) then
      write(*,'("Problem opening geo_finegrid file: ''", A, "''")') &
           trim(nlst_rt(1)%geo_finegrid_flnm)
      write(*,*) "HIRES_OUTPUT will not be georeferenced..."
      projInfo_flag = 0
   else
      projInfo_flag = 1
   endif
   
   if(projInfo_flag.eq.1) then !if/then hires_georef
      ! Get projection information from finegrid netcdf file
      iret = NF_INQ_VARID(ncstatic,'lambert_conformal_conic',varid)
      if(iret .eq. 0) &
           iret = NF_GET_ATT_REAL(ncstatic, varid, 'longitude_of_central_meridian', long_cm)
      iret = NF_GET_ATT_REAL(ncstatic, varid, 'latitude_of_projection_origin', lat_po)
      iret = NF_GET_ATT_REAL(ncstatic, varid, 'false_easting', fe)  
      iret = NF_GET_ATT_REAL(ncstatic, varid, 'false_northing', fn)  
      iret = NF_GET_ATT_REAL(ncstatic, varid, 'standard_parallel', sp)  
   end if  !endif hires_georef 
   iret = nf_close(ncstatic)
   
   
   ! Create the channel connectivity file
   print*,'Ndg: output_flnm = "'//trim(output_flnm)//'"'
   flush(6)

   write(6,*) "using large netcdf file for CHANNEL_CONNECTIVITY"
   iret = nf_create(trim(output_flnm), ior(NF_CLOBBER,NF_64BIT_OFFSET), ncid)

   if (iret /= 0) then
      print*,"Ndg: Problem nf_create"
      call hydro_stop("output_channel_connectivity")
   endif

   nStreamCells=size(CHLON,1)
   print*,'Ndg: nStreamCells:', nStreamCells
   flush(6)

   ! Dimension definitions
   iret = nf_def_dim(ncid, "nStreamCells", nStreamCells, streamCellDimID)  

   ! Variable definitions
   ! LATITUDE - float
   iret = nf_def_var(ncid, "LATITUDE", NF_FLOAT, 1, (/ streamCellDimID /), varid)
   iret = nf_put_att_text(ncid,varid, 'long_name',     22, 'Upstream cell latitude')
   iret = nf_put_att_text(ncid,varid, 'standard_name',  8, 'LATITUDE')
   iret = nf_put_att_text(ncid,varid, 'units',          5, 'deg North')

   ! LONGITUDE - float
   iret = nf_def_var(ncid, "LONGITUDE", NF_FLOAT, 1, (/ streamCellDimID /), varid)
   iret = nf_put_att_text(ncid, varid, 'long_name',     23, 'Upstream cell longitude')
   iret = nf_put_att_text(ncid, varid, 'standard_name',  9, 'LONGITUDE')
   iret = nf_put_att_text(ncid, varid, 'units',          8, 'deg East')

   ! CHANLEN - float
   ! JLM: should check if pour points have chanLen, should they?
   iret = nf_def_var(ncid, "CHANLEN", NF_FLOAT, 1, (/ streamCellDimID /), varid)
   iret = nf_put_att_text(ncid, varid, 'units',      1,'m')
   iret = nf_put_att_text(ncid, varid, 'long_name', 58, &
        'distance between stream cell center points with downstream')
   iret = nf_put_att_real(ncid, varid, 'missing_value', NF_REAL, 1, -9E15)



   ! FROM_NODE - integer
   iret = nf_def_var(ncid, "FROM_NODE", NF_INT, 1, (/ streamCellDimID /), varid)
   iret = nf_put_att_text(ncid, varid, 'units',      5, 'index')
   iret = nf_put_att_text(ncid, varid, 'long_name', 19, 'Upstream cell index')
   iret = nf_put_att_int(ncid, varid, 'missing_value', NF_INT, 1, -9999)

   ! TO_NODE - integer
   iret = nf_def_var(ncid, "TO_NODE", NF_INT, 1, (/ streamCellDimID /), varid)
   iret = nf_put_att_text(ncid, varid, 'units',      5, 'index')
   iret = nf_put_att_text(ncid, varid, 'long_name', 21, 'Downstream cell index')
   iret = nf_put_att_int(ncid, varid, 'missing_value', NF_INT, 1, -9999)

   ! CHANXI - integer
   iret = nf_def_var(ncid, "CHANXI", NF_INT, 1, (/ streamCellDimID /), varid)
   iret = nf_put_att_text(ncid, varid, 'units',      5, 'index')
   iret = nf_put_att_text(ncid, varid, 'long_name', 34, 'Upstream cell x index on fine grid')
   iret = nf_put_att_int(ncid, varid, 'missing_value', NF_INT, 1, -9999)

   ! CHANYJ - integer
   iret = nf_def_var(ncid, "CHANYJ", NF_INT, 1, (/ streamCellDimID /), varid)
   iret = nf_put_att_text(ncid, varid, 'units',      5, 'index')
   iret = nf_put_att_text(ncid, varid, 'long_name', 34, 'Upstream cell y index on fine grid')
   iret = nf_put_att_int(ncid, varid, 'missing_value', NF_INT, 1, -9999)

   ! TYPEL - integer
   iret = nf_def_var(ncid, "TYPEL", NF_INT, 1, (/ streamCellDimID /), varid)
   iret = nf_put_att_text(ncid, varid, 'units',      5, 'code')
   iret = nf_put_att_text(ncid, varid, 'long_name', 80, &
        'Link Type 0 is channel 1 is pour point crit depth downstream 2 is reservoir lake')

   ! LAKENODE - integer
   iret = nf_def_var(ncid, "LAKENODE", NF_INT, 1, (/ streamCellDimID /), varid)
   iret = nf_put_att_text(ncid, varid, 'units',      5, 'index')
   iret = nf_put_att_text(ncid, varid, 'long_name', 32, 'Index of lake in downstream cell')


   ! Projection information
   if(projInfo_flag .eq. 1) then
      iret = nf_def_var(ncid, "lambert_conformal_conic", NF_INT, 0, 0, varid)
      iret = nf_put_att_text(ncid, varid, 'grid_mapping_name', 23, 'lambert_conformal_conic')
      iret = nf_put_att_real(ncid, varid, 'longitude_of_central_meridian', NF_FLOAT, 1, long_cm)
      iret = nf_put_att_real(ncid, varid, 'latitude_of_projection_origin', NF_FLOAT, 1, lat_po)
      iret = nf_put_att_real(ncid, varid, 'false_easting',                 NF_FLOAT, 1, fe)
      iret = nf_put_att_real(ncid, varid, 'false_northing',                NF_FLOAT, 1, fn)
      iret = nf_put_att_real(ncid, varid, 'standard_parallel',             NF_FLOAT, 2, sp)
   end if

   ! End NCDF definition section
   iret = nf_enddef(ncid)

   ! Put data in to the file

   ! Data for the dim? JLM: no, seems pointless index, if not necessary
   !iret = nf_inq_varid(ncid,"nStreamCells", varid)
   !iret = nf_put_vara_int(ncid, varid, (/1/), (/ nStreamCells /), 1:nStreamCells - or however you)

   ! Reals
   iret = nf_inq_varid(ncid, "LATITUDE", varid)
   iret = nf_put_vara_real(ncid, varid, (/1/), (/ nStreamCells /), CHLAT)

   iret = nf_inq_varid(ncid, "LONGITUDE", varid)
   iret = nf_put_vara_real(ncid, varid, (/1/), (/ nStreamCells /), CHLON)

   iret = nf_inq_varid(ncid, "CHANLEN", varid)
   iret = nf_put_vara_real(ncid, varid, (/1/), (/ nStreamCells /), CHANLEN)

   ! Integers
   iret = nf_inq_varid(ncid, "FROM_NODE", varid)
   iret = nf_put_vara_int(ncid, varid, (/1/), (/ nStreamCells /), FROM_NODE)

   iret = nf_inq_varid(ncid, "TO_NODE", varid)
   iret = nf_put_vara_int(ncid, varid, (/1/), (/ nStreamCells /), TO_NODE)

   iret = nf_inq_varid(ncid, "CHANXI", varid)
   iret = nf_put_vara_int(ncid, varid, (/1/), (/ nStreamCells /), CHANXI)

   iret = nf_inq_varid(ncid, "CHANYJ", varid)
   iret = nf_put_vara_int(ncid, varid, (/1/), (/ nStreamCells /), CHANYJ)

   iret = nf_inq_varid(ncid, "TYPEL", varid)
   iret = nf_put_vara_int(ncid, varid, (/1/), (/ nStreamCells /), TYPEL)

   iret = nf_inq_varid(ncid, "LAKENODE", varid)
   iret = nf_put_vara_int(ncid, varid, (/1/), (/ nStreamCells /), LAKENODE)


   ! Close the file
   iret = nf_close(ncid)

endif

deallocate(chLat, chLon, chanLen, from_node, to_node, chanXI, chanYJ, typeL, lakeNode)

if(my_id .eq. io_id) then
   write(6,*) "end of output_chan_connectivity" 
   flush(6)
endif

end subroutine output_chan_connectivity

!===================================================================================================
! Program Names: 
!   get_1d_netcdf_real, get_1d_netcdf_int4
! Author(s)/Contact(s): 
!   James L McCreight <jamesmcc><ucar><edu>
! Abstract: 
!   Read a variable of real or integer type from an open netcdf file, respectively. 
! History Log: 
!   7/17/15 -Created, JLM.
! Usage:
! Parameters: 
!   See definitions.
! Input Files: 
!   This file is refered to by it's "ncid" obtained from nc_open
!   prior to calling this routine. 
! Output Files: 
!   None.
! Condition codes: 
!   hydro_stop is passed "get_1d_netcdf".
! User controllable options: 
! Notes: 
!   Could define an interface for these. 

subroutine get_1d_netcdf_int2(ncid, varName, var, callingRoutine, fatal_if_error, errStatus)
implicit none
integer*4,               intent(in)  :: ncid !! the file identifier
character(len=*),        intent(in)  :: varName
integer*2, dimension(:), intent(out) :: var
character(len=*),        intent(in)  :: callingRoutine
logical,                 intent(in)  :: fatal_if_error
integer,                 intent(out) :: errStatus
integer :: varid, iret
errStatus=0
iRet = nf90_inq_varid(ncid, varName, varid)
if (iret /= nf90_NoErr) then
   print*, trim(callingRoutine) // ": get_1d_netcdf_int2: variable: " // trim(varName)
   if (fatal_IF_ERROR) call hydro_stop("get_1d_netcdf_int2")
   errStatus=errStatus+1
end if
iRet = nf90_get_var(ncid, varid, var)
if (iret /= nf90_NoErr) then
   print*, trim(callingRoutine) // ": get_1d_netcdf_int2: values: " // trim(varName)   
   if (fatal_IF_ERROR) call hydro_stop("get_1d_netcdf_int2")
   errStatus=errStatus+1
end if
end subroutine get_1d_netcdf_int2


subroutine get_1d_netcdf_int4(ncid, varName, var, callingRoutine, fatal_if_error, errStatus)
implicit none
integer*4,             intent(in)  :: ncid !! the file identifier
character(len=*),      intent(in)  :: varName
integer, dimension(:), intent(out) :: var
character(len=*),      intent(in)  :: callingRoutine
logical,               intent(in)  :: fatal_if_error
integer,               intent(out) :: errStatus
integer :: varid, iret
errStatus=0
iRet = nf90_inq_varid(ncid, varName, varid)
if (iret /= nf90_NoErr) then
   print*, trim(callingRoutine) // ": get_1d_netcdf_int4: variable: " // trim(varName)
   if (fatal_IF_ERROR) call hydro_stop("get_1d_netcdf_int4")
   errStatus=errStatus+1
end if
iRet = nf90_get_var(ncid, varid, var)
if (iret /= nf90_NoErr) then
   print*, trim(callingRoutine) // ": get_1d_netcdf_int4: values: " // trim(varName)   
   if (fatal_IF_ERROR) call hydro_stop("get_1d_netcdf_int4")
   errStatus=errStatus+1
end if
end subroutine get_1d_netcdf_int4


subroutine get_1d_netcdf_real(ncid, varName, var, callingRoutine, fatal_if_error, errStatus)
implicit none
integer,            intent(in)  :: ncid !! the file identifier
character(len=*),   intent(in)  :: varName
real, dimension(:), intent(out) :: var
character(len=*),   intent(in)  :: callingRoutine
logical,            intent(in)  :: fatal_if_error
integer,            intent(out) :: errStatus
integer :: varId, iRet
errStatus=0
iRet = nf90_inq_varid(ncid, varName, varid)
if (iret /= nf90_NoErr) then
   print*, trim(callingRoutine) // ": get_1d_netcdf_real: variable: " // trim(varName)
   if (fatal_IF_ERROR) call hydro_stop("get_1d_netcdf_real")
   errStatus=errStatus+1
end if
iRet = nf90_get_var(ncid, varid, var)
if (iret /= nf90_NoErr) then
   print*, trim(callingRoutine) // ": get_1d_netcdf_real: values: " // trim(varName)
   if (fatal_IF_ERROR) call hydro_stop("get_1d_netcdf_real")
   errStatus=errStatus+1
end if
end subroutine get_1d_netcdf_real


subroutine get_1d_netcdf_text(ncid, varName, var, callingRoutine, fatal_if_error, errStatus)
implicit none
character(len=*), dimension(:), intent(out) :: var
integer,                        intent(in)  :: ncid !! the file identifier
character(len=*),               intent(in)  :: varName
character(len=*),               intent(in)  :: callingRoutine
logical,                        intent(in)  :: fatal_if_error
integer,                        intent(out) :: errStatus
integer :: varId, iRet
errStatus=0
iRet = nf90_inq_varid(ncid, varName, varid)
if (iret /= nf90_NoErr) then
   print*, trim(callingRoutine) // ": get_1d_netcdf_text: variable: " // trim(varName)
   if (fatal_IF_ERROR) call hydro_stop("get_1d_netcdf_text")
   errStatus=errStatus+1
end if
iRet = nf90_get_var(ncid, varid, var)
if (iret /= nf90_NoErr) then
   print*, trim(callingRoutine) // ": get_1d_netcdf_text: values: " // trim(varName)
   if (fatal_IF_ERROR) call hydro_stop("get_1d_netcdf_text")
   errStatus=errStatus+1
end if
end subroutine get_1d_netcdf_text


!==============================================================================
! 3D real 
subroutine get_3d_netcdf_real(ncid, varName, var, callingRoutine, fatal_if_error, errStatus)
implicit none
integer,                intent(in)  :: ncid !! the file identifier
character(len=*),       intent(in)  :: varName
real, dimension(:,:,:), intent(out) :: var
character(len=*),       intent(in)  :: callingRoutine
logical,                intent(in)  :: fatal_if_error
integer,                intent(out) :: errStatus
integer :: varId, iRet
errStatus=0
iRet = nf90_inq_varid(ncid, varName, varid)
if (iret /= nf90_NoErr) then
   print*, trim(callingRoutine) // ": get_3d_netcdf_real: variable: " // trim(varName)
   if (fatal_IF_ERROR) call hydro_stop("get_3d_netcdf_real")
   errStatus=errStatus+1
end if
iRet = nf90_get_var(ncid, varid, var)
if (iret /= nf90_NoErr) then
   print*, trim(callingRoutine) // ": get_3d_netcdf_real: values: " // trim(varName)
   if (fatal_IF_ERROR) call hydro_stop("get_3d_netcdf_real")
   errStatus=errStatus+1
end if
end subroutine get_3d_netcdf_real

!===================================================================================================
! Program Names: 
!   get_netcdf_dim
! Author(s)/Contact(s): 
!   James L McCreight <jamesmcc><ucar><edu>
! Abstract: 
!   Get the length of a provided dimension.
! History Log: 
!   7/23/15 -Created, JLM.
! Usage:
! Parameters: 
!   file: character, the file to query
!   dimName: character, the name of the dimension
!   callingRoutine: character, the name of the calling routine for error messages
! Input Files:  
!   Specified argument. 
! Output Files: 
! Condition codes: 
!   hydro_stop is called. .
! User controllable options:
! Notes: 

function get_netcdf_dim(file, dimName, callingRoutine, fatalErr) 
implicit none
integer :: get_netcdf_dim  !! return value, zero if failure
character(len=*), intent(in)   :: file, dimName, callingRoutine
logical, optional, intent(in) :: fatalErr
logical :: fatalErr_local
integer :: ncId, dimId, iRet

fatalErr_local = .false.
if(present(fatalErr)) fatalErr_local=fatalErr

write(*,'("getting dimension from file: ''", A, "''")') trim(file)
flush(6)

iRet = nf90_open(trim(file), nf90_NOWRITE, ncId)
if (iret /= nf90_noerr) then
   write(*,'("Problem opening file: ''", A, "''")') trim(file)
   if(fatalErr_local) call hydro_stop(trim(callingRoutine) // ': get_netcdf_dim')
   get_netcdf_dim = 0
   return
endif

iRet = nf90_inq_dimid(ncId, trim(dimName), dimId)
if (iret /= nf90_noerr) then
   write(*,'("Problem getting the dimension ID: ''", A, "''")') trim(file)
   if(fatalErr_local) call hydro_stop(trim(callingRoutine) // ': get_netcdf_dim')
   get_netcdf_dim = 0
   return
endif

iRet = nf90_inquire_dimension(ncId, dimId, len= get_netcdf_dim)
if (iret /= nf90_noerr) then
   write(*,'("Problem getting the dimension length: ''", A, "''")') trim(file)
   if(fatalErr_local) call hydro_stop(trim(callingRoutine) // ': get_netcdf_dim')
   get_netcdf_dim = 0
   return
endif

iRet = nf90_close(ncId)
if (iret /= nf90_noerr) then
   write(*,'("Problem closing file: ''", A, "''")') trim(file)
   if(fatalErr_local) call hydro_stop(trim(callingRoutine) // ': get_netcdf_dim')
   get_netcdf_dim = 0
   return
endif
end function get_netcdf_dim


!===================================================================================================
end module module_nudging_io
 
