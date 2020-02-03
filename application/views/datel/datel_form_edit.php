<section class="content-header">
  <h1>
    Datel
    <small>Data Datel</small>
  </h1>
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i></a></li>
    <li class="active">Datel</li>
  </ol>
</section>

<!-- Main content -->
<section class="content">

  <div class="box">
      <div class="box-header">
        <h3 class="box-title">Edit Datel</h3>
        <div class="pull-right">
            <a href="<?=site_url('Admin/getDatel')?>" class="btn btn-warning btn-flat">
                <i class="fa fa-undo"></i> Back 
            </a>
        </div>
      </div>
      <div class="box-body">
         <div class="row">
             <div class="col-md-4 col-md-offset-4">
                <form action="" method="post"> 
                    <div class="form-group <?=form_error('idDatel') ? 'has-error' : null?>">
                        <label>ID Datel *</label>
                        <input type="hidden" name="idDatel" value="<?=$row->idDatel?>">
                        <input type="text" name="idDatel" value="<?=$this->input->post('idDatel') ?? $row->idDatel?>" class="form-control"> 
                        <?=form_error('idDatel')?>
                    </div>
                    <div class="form-group <?=form_error('namaDatel') ? 'has-error' : null?>">
                        <label>Nama Datel *</label>
                        <input type="text" name="namaDatel" value="<?=$this->input->post('namaDatel') ?? $row->namaDatel?>" class="form-control">
                        <?=form_error('namaDatel')?>
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