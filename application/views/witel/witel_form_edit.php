<section class="content-header">
  <h1>
    Witel
    <small>Data Witel</small>
  </h1>
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i></a></li>
    <li class="active">Witel</li>
  </ol>
</section>

<!-- Main content -->
<section class="content">

  <div class="box">
      <div class="box-header">
        <h3 class="box-title">Edit Witel</h3>
        <div class="pull-right">
            <a href="<?=site_url('Admin/getWitel')?>" class="btn btn-warning btn-flat">
                <i class="fa fa-undo"></i> Back 
            </a>
        </div>
      </div>
      <div class="box-body">
         <div class="row">
             <div class="col-md-4 col-md-offset-4">
                <form action="" method="post"> 
                    <div class="form-group <?=form_error('idWitel') ? 'has-error' : null?>">
                        <label>ID Witel *</label>
                        <input type="hidden" name="idWitel" value="<?=$row->idWitel?>">
                        <input type="text" name="idWitel" value="<?=$this->input->post('idWitel') ?? $row->idWitel?>" class="form-control"> 
                        <?=form_error('idWitel')?>
                    </div>
                    <div class="form-group <?=form_error('namaWitel') ? 'has-error' : null?>">
                        <label>Nama Witel *</label>
                        <input type="text" name="namaWitel" value="<?=$this->input->post('namaWitel') ?? $row->namaWitel?>" class="form-control">
                        <?=form_error('namaWitel')?>
                    </div>
                    <div class="form-group <?=form_error('keterangan') ? 'has-error' : null ?>">
                            <label>Keterangan</label>
                            <textarea name="keterangan" class="form-control" rows="3"><?=$row->keterangan?></textarea>
                            <?=form_error('keterangan')?>
                        </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-success btn-flat">
                            <i class="fa fa-paper-plane"></i> Simpan
                        </button>
                        <button type="reset" class="btn btn-flat">Reset</button>
                    </div>
                </form>
             </div>
         </div>
      </div>
  </div>

</section>