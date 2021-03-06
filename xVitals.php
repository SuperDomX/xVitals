<?php
/**
 * @name Visitors
 * @desc Truely indepth information about your website; Statistically.
    * @version v0.1(160710)
    * @author  @xopherdeep
 * @icon bar-chart-o
 * @mini globe
 * @see clicks
 * @link vitals
 * @todo
 * @delta true
 */

  class xVitals extends Xengine{
    var $class_name = 'xVitals';

    function dbSync(){
      return array(
        'page_visits'   => array(),
        'web_sessions'  => array(),
        'page_landings' => array(
          'page_views'    => array('Type' => 'int(8)'),
          'unique_hits'     => array('Type' => 'int(8)'),
          'last_accessed'   => array('Type' => 'int(12)'),
          'request_call'    => array('Type' => 'varchar(255)'),
          'request_action'  => array('Type' => 'varchar(255)'),
          'request_uri'   => array('Type' => 'varchar(255)')
        )
      );
    }
    
    function autoRun($X){
      //$this->doSessionTime();     # SessionTime for Everyone...
      if(!$X->atBackDoor){
        $this->hitCount();
      }
            # How many times the website has loaded for other users.
      
      if(!$this->atBackDoor){       # Dont track the admin panel or admins - at least not here.
        
        $this->incPageLanding();  ### Track the page landing. 
        if($X->Xtra == 'index'){
          var_dump($this->_SET['action']);
          exit;
        }
      }else{
        //$this->leaveBreadCrumb();  
      }
      
      if($X->Key['is']['admin']){
        $call = $this->_SET['action'];
        $action = $this->_SET['method'];

        $page_landing = $this->Q->Select('*','page_landings', array(
          'request_uri'   => $_SERVER['REQUEST_URI'],
          'request_call'    => $call,
          'request_action'  => $action
        ));
        
        $this->set('page_landing', $page_landing[0]);

        $this->set('SVR',$_SERVER);
        // $stats = $X->statistics();
        $this->set('site_stats',$stats);
  


        $this->set('total_used_space', 
          ( isset($_SESSION['tmp']['disk_space']) ) 
          ? 
            $this->getTotalSpaceSize()
          : 
            $this->getTotalSpaceSize()
          );


      }     

      $this->set('HTTP_HOST_TOTAL_HITS', $this->getTotalHits() );

      if($X->Key['is']['user'])
        $this->doUniqueHit();   ### Do Unique Hit
    }

    function settings(){
    }

    function statistics($function='')
    {
      return array(
        "emails" => count($this->Q->Select("id",'Users',"last_login > UNIX_TIMESTAMP( NOW() - INTERVAL 24 HOUR )")),
        //'Q' => $this->Q->error,
        "visits" => $this->getTotalVisits(),
        "users" => $this->getTotalUsers(),
        "hits" => $this->getTotalHits(),
        'success'=>true

      );
    }

    public function getTotalVisits()
    {
      return count($this->Q->Select("DISTINCT('client_ip')",'page_visits'));
      # code...
    }

    public function getTotalUsers()
    {
      return count($this->Q->Select('id','Users'));
      # code...
    } 

    public function getTotalHits()
    {
      # Hit Counter...
      $c = $this->_CFG['dir']['cfg'].'/count.'.$_SERVER['SERVER_NAME'].'.hits'; 
      return file_get_contents($c);
    }

    public function getTotalSpaceSize( )
    {
      $mount = CFG_DIR.'/'.$_SERVER['HTTP_HOST'];

      if(!is_dir($mount)){
        mkdir($mount);
      }

      function foldersize($path) {
          $total_size = 0;
          $files = scandir($path);
          $cleanPath = rtrim($path, '/'). '/';

          foreach($files as $t) {
              if ($t<>"." && $t<>"..") {
                  $currentFile = $cleanPath . $t;
                  if (is_dir($currentFile)) {
                      $size = foldersize($currentFile);
                      $total_size += $size;
                  }
                  else {
                      $size = filesize($currentFile);
                      $total_size += $size;
                  }
              }   
          }

          return $total_size;
      }


      function format_size($size) {
          
        $units = explode(' ', 'B KB MB GB TB PB');
          $mod = 1024;

          for ($i = 0; $size > $mod; $i++) {
              $size /= $mod;
          }

          $endIndex = strpos($size, ".")+3;

          return substr( $size, 0, $endIndex).' '.$units[$i];
      }


        $SIZE_LIMIT = 5368709120; // 5 GB
        $disk_used = foldersize($mount);

        $disk_remaining = $SIZE_LIMIT - $disk_used;

        $size = $_SESSION['tmp']['space_size'] = array(
          'used' => format_size($disk_used),
          'left' => format_size($disk_remaining),
          'limit' => format_size($SIZE_LIMIT)
        );

      

        return $size;
    }
    
    

    function leaveBreadCrumb($X){
      $_SESSION['crumbs'][] = array(
        'request_uri' => $_SERVER['REQUEST_URI'],
        'title'       => $this->_SET['HTML']['HEAD']['TITLE'],
        'call'        => $this->_SET['action'],
        'action'      => $this->_SET['method']
      );
      
      return array(
        'crumbs'      => $_SESSION['crumbs'],
        'crumb_count' => count($_SESSION['crumbs'])
      );
    }
    
    function doSessionTime(){
      ### Stores timestamp of last activity
      $_SESSION['session']['last_seen'] = time();
      $q = $this->q();
      $session = $q->Select('*','web_sessions',array(
        'session_id' => session_id()
      ));
      if(!isset($_SESSION['user'])){
        $_SESSION['session']['start_time'] = time();
        $q->Insert('web_sessions',array(
          'session_id'    => session_id(),
          'start_time'    => $_SESSION['session']['start_time'],
          'last_seen'     => $_SESSION['session']['last_seen'],
          'total_seconds' => 0,
          'user_id'       => $_SESSION['user']['id'],
          'last_request'  => $_SERVER['REQUEST_URI']
        ));
        $this->doSessionTime();
      }else{
        $session = $session[0];
        $q->Update('web_sessions',array(
          'user_id'       => $_SESSION['user']['id'],
          'last_seen'     => $_SESSION['session']['last_seen'],
          'total_seconds' => $_SESSION['session']['last_seen'] - $session['start_time'],
          'last_request'  => $_SERVER['REQUEST_URI']  
        ),array(
          'session_id' => session_id()
        )); 
      }
      // if( $_SESSION['user']['id']){
      //  $q->Update('Users',array(
      //    'last_active'   => time(),
      //    'last_location' => $_SERVER['REQUEST_URI']
      //  ),array(
      //    'id'  =>  $_SESSION['user']['id']
      //  )); 
      // }
    }
    
    /**
     * 
     */
    function doUniqueHit(){
      $q = $this->q();
      
      ### First, lets track this hit!
      $q->Insert('page_visits',array(
        'client_ip'     => $_SERVER["REMOTE_ADDR"],
        'client_browser'  => $_SERVER["HTTP_USER_AGENT"],
        'user_id'     => $_SESSION['user']['id'],
        'timestamp'     => time(),
        'request_call'    => $this->_SET['action'],
        'request_action'  => $this->_SET['method'],
        'request_uri'   => $_SERVER['REQUEST_URI']/*,
        'script_uri'    => $_SERVER["SCRIPT_URI"]*/
      ));
      
      ### Now lets find how many times we've tracked it.
      $tracks = $q->Select('id','page_visits',array(
        'client_ip'     => $_SERVER["REMOTE_ADDR"],
        'client_browser'  => $_SERVER["HTTP_USER_AGENT"],
        'request_call'    => $this->_SET['action'],
        'request_action'  => $this->_SET['method'],
        'request_uri'   => $_SERVER['REQUEST_URI']
      ));
      
      if(1 == count($tracks)){  # First TIME! - Unique hit.
        ### Count the Hit
        $q->Inc('page_landings','unique_hits',1,array(
          'request_call'    => $this->_SET['action'],
          'request_action'  => $this->_SET['method'],
          'request_uri'   => $_SERVER['REQUEST_URI']
        ));
 
        
      } 
    }
    
    /*
     Counts how many times Xengine has Ran -
    */
    function hitCount($count=1){
      if($count){
        $f = $this->_CFG['dir']['cfg'].'/count.'.$_SERVER['SERVER_NAME'].'.hits';
        # Hit Counter...
        if(!file_exists($f)){
          $count = 0;
          file_put_contents($f,$count);
        }
        $count = file_get_contents($f);
        $count++;
        file_put_contents($f,$count);
        $this->set('LOAD_COUNTER',$count);  
      }
    }
    
    /**
     * Stores the page request and 
     */
    function incPageLanding(){
      $q      = $this->q();
      $call   = $this->_SET['action'];
      $action = $this->_SET['method'];
      # We can get the Call and Action of each page and store the hit in the db.
      $page   = $q->Select('*','page_landings',array(
        'request_call'   => $call,
        'request_action' => $action,
        'request_uri'    => $_SERVER['REQUEST_URI']
      ));
      
      #################################################
      ### Page is empty, we've never hit this before! Start Tracking
      if(empty($page)){   
        $id = $q->Insert('page_landings',array(
          'request_call'    => $call,
          'request_action'  => $action,
          'request_uri'   => $_SERVER['REQUEST_URI'],
          'page_views'    => 0,
          'unique_hits'   => 0,
          'last_accessed'   => time()
        ));
      }else{
        $id = $page[0]['id'];
      }
      ################################################
      
      // var_dump($this->_SET);
      // exit;

      ### Count the Hit
      $q->Inc('page_landings','page_views',1,array(
        'id' => $id
      ));
    }
    
    function index($days=8){
      $this->set('WWW_PAGE','Analytics');
      $this->viewsVisitsSince($days);
    }
    
    function viewsVisitsSince($since){
      $q = $this->q();
      
      ### Get this weeks visits
      $weekvisits = $q->Select('*','page_visits',array(
        'timestamp'=>time() - ((60*60)*24)*$since
      ),'left','>');
      
      $stats    = array();
      $visits     = array();
      $unique     = array();
      $page_views = 0;
      $unique_hits = 0; 
      
      ### Loop through each day
      for($i=0;$i<=$since;$i++){
        # Get Today @ Midnight
        $midnight = strtotime(date('d M Y').' 00:00:00');
        # get day
        $day  = ( (60*60)* 24 )* $i ;
        
        $today    = $midnight - $day;
        $date     = date('D M jS',$today);
        $views = 0;
        ### Get all the stats for the day
        $stats[$date] = array();
        
        foreach($weekvisits as $k => $dayvisit){
          if($dayvisit['timestamp'] >= $today ){
            $visitor  = $dayvisit['client_ip'];
            if(!isset($stats[$date][$visitor])){
              $stats[$date][$visitor] = 0;
            }else{
              $stats[$date][$visitor]++;  
            }
            
            $views++;
            // Remove it once counted.
            unset($weekvisits[$k]);
          } 
        }

        $visits[] = array(
          'x'=> $today*1000,
          'y'=> $views
          //'visits'=> count($stats[$date])
        );

        $unique[] = array(
          'x'=> $today*1000,
          //'views'=> $views,
          'y'=> count($stats[$date])
        );

        $page_views = $views + $page_views;
        $unique_hits = count($stats[$date]) + $unique_hits;
      }
      
      $sessions = $q->Select('total_seconds,last_seen','web_sessions');
      $total_time = 0;
      $people_online = 0;
      foreach($sessions as $k => $v){
        $total_time = $total_time + $v['total_seconds'];
        if($v['last_seen'] >= (time() - (60*10) ) ){
          $people_online++; 
        }
      }
      $this->set('AVG_TIME', round($total_time / count($sessions) / 60) );
      $this->set('NUM_ONLINE', $people_online);
      ###
      $this->set('PAGE_VIEWS',$page_views);
      $this->set('UNIQUE_HITS',$unique_hits);

      $data[] = array('key' => 'Unique', 'bar'=>true, 'values' => $unique );
      $data[] = array('key' => 'Visits', 'values' => $visits);

      $this->set('data',array_reverse($data));
    }

    function chart($days=8){
      $this->viewsVisitsSince($days);
    }

    function crumb_trail($eat=false){
      $this->set('WWW_PAGE','Analytics');
      if($eat){
        unset($_SESSION['crumbs']);
        header('Location: /');
      }
    }
  }
?>
