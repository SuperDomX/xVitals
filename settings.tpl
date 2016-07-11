{$XTRA="X{$Xtra|strtoupper}"}
<section class="">
    <div class="body">
      <div id="wizard" class="form-wizard">
        <div id="bar" class="progress progress-large">
            <div class="progress-bar progress-bar-success">
            </div>
        </div>
        <ul class="wizard-navigation nav-justified hidden-xs">
            <li>
              <a href="#tab1" data-toggle="tab"><b>1.</b> 
                <strong> 
                  <i class="fa fa-google"></i> 
                  Title {$HTTP_HOST}
                </strong>
              </a>
            </li>
            <!-- <li><a href="#tab2" data-toggle="tab"><b>2.</b> <strong><i class="fa fa-globe"></i> Super Sub Domains</strong></a></li> -->
            <!-- <li> -->
            <!--   <a href="#tab2" data-toggle="tab"> -->
            <!--     <small>2.</small>  -->
            <!--     <strong> -->
            <!--       <i class="fa fa-anchor"></i>  -->
            <!--       Addresses -->
            <!--     </strong> -->
            <!--   </a> -->
            <!-- </li> -->
            <li>
              <a href="#tab3" data-toggle="tab">
                <b></b> 
                <strong>
                  <i class="fa fa-check"></i> Finish
                </strong>
              </a>
            </li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane text-center col-md-12" id="tab1">
              <h2>
                {$LANG.$XTRA.$method.wizard.title}
                <br/>
                <small>
                  {$LANG.$XTRA.$method.wizard.title}
                </small>
              </h2>
              <hr/>
              {$i = $LANG.$XTRA.$method.wizard.step_1}
              {include file="~widgets/ajax.form.tpl" input=$i}
          </div>
          <div class="tab-pane text-center col-md-12" id="tab3">
              <h1>Thank you!
                <br/>
                <small>
                  Click "Finish" to close this dialog.
                </small>
              </h1>
          </div>
          <div class="description">
          </div>
          <ul class="pager wizard">
            <li class="previous col-xs-6">
                <button class="btn btn-warning btn-block btn-lg pull-left"><i class="fa fa-caret-left"></i> Previous</button>
            </li>
            <li class="next col-xs-6 ">
                <button class="btn btn-info btn-block btn-lg pull-right" >Next <i class="fa fa-caret-right"></i></button>
            </li>
            <li class="finish col-xs-6" style="display: none">
                <button class="btn btn-success btn-block btn-lg pull-right" data-dismiss="modal" >Finish <i class="fa fa-check"></i></button>
            </li>
          </ul>
        </div>
      </div>
    </div>
</section>
<script>
  $('#modal-{$method}').on('hidden.bs.modal', function () {
    $($('.nav-pills li a')[0]).click()
  });
</script>
<script type="text/javascript" src="/x/html/layout/watchtower/js/wizard.js"> </script>
